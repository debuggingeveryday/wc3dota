import { useState, useRef } from "react";

function App() {
  const [copied, setCopied] = useState(false);
  const [skillID, setSkillID] = useState("");
  const [hotKey, setHotKey] = useState("");
  const [skillName, setSkillName] = useState("");
  const textRef = useRef(null);

  const handleChange = (event) => {
    const type = event.target.name;
    const value = event.target.value;

    switch (type) {
      case "id":
        setSkillID(value);
        break;
      case "name":
        setSkillName(value);
        break;
    }
  };

  const handleSelect = (event) => {
    const value = event.target.value;

    setHotKey(value);
  };

  const handleCopy = async () => {
    try {
      // Core native API that copies text to the system clipboard
      const textToCopy = textRef.current.innerText;

      await navigator.clipboard.writeText(textToCopy);

      // Update state to show feedback
      setCopied(true);

      // Reset the button text back to "Copy" after 2 seconds
      setTimeout(() => setCopied(false), 2000);
    } catch (err) {
      console.error("Failed to copy text: ", err);
    }
  };

  return (
    <>
      <div>
        <div>
          <div>
            <label>Skill ID</label>
            <input
              type="text"
              value={skillID}
              name="id"
              onChange={handleChange}
            />
          </div>
        </div>
        <div>
          <label>Skill Name</label>
          <input
            type="text"
            value={skillName}
            name="name"
            onChange={handleChange}
          />
        </div>

        <div>
          <label for="key">Hotkey: </label>
          <select name="key" id="key" onChange={handleSelect}>
            <option value="Y">Y</option>
            <option value="U">U</option>
            <option value="I">I</option>
            <option value="O">O</option>
            <option value="K">K</option>
            <option value="L">L</option>
          </select>
        </div>
      </div>
      <pre ref={textRef}>
        {`
[${skillID}]
Tip=[|cff81BAFF${hotKey}|r] ${skillName} - [|cffffcc00Level 1|r],[|cff81BAFF${hotKey}|r] ${skillName} - [|cffffcc00Level 2|r],[|cff81BAFF${hotKey}|r] ${skillName} - [|cffffcc00Level 3|r],[|cff81BAFF${hotKey}|r] ${skillName} - [|cffffcc00Level 4|r]
Researchtip="[|cff81BAFF${hotKey}|r] Learn ${skillName} - [|cffffcc00Level %d|r]"
Hotkey=${hotKey}
Researchhotkey=${hotKey}
`}
      </pre>
      <button type="button" onClick={handleCopy}>
        Copy
      </button>
      <span>{copied ? "✓ Copied!" : "Copy Text"}</span>
    </>
  );
}

export default App;
