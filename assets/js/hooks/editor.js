import ace from "brace"
import "brace/mode/html"
import "brace/mode/yaml"
import "brace/theme/pastel_on_dark"
import "brace/ext/searchbox"

export default {
  save() {
    this.pushEventTo("#editor", "save", { value: this.editor.getValue() })
  },

  cancel() {
    this.pushEventTo("#editor", "cancel")
  },

  destroyed() {
    this.editor.destroy()
  },

  mounted() {
    // Setup Ace Editor
    const editor_element = this.el.querySelector("#ace-editor");
    var mode = this.el.dataset.mode;
    this.editor = ace.edit(editor_element)
    this.editor.setOptions({
      autoScrollEditorIntoView: true,
      copyWithEmptySelection: true,
    });

    // use setOptions method
    this.editor.setOption("mergeUndoDeltas", "always");

    this.editor.getSession().setMode(`ace/mode/${mode}`)
    this.editor.setTheme("ace/theme/pastel_on_dark")
    this.editor.getSession().on("change",  () => {                
      document.getElementById('editor-content').value = this.editor.getSession().getValue();
    });
    
    this.editor.focus()

    // Handle `meta+s` to save
    this.editor.commands.addCommand({
      name: 'save',
      bindKey: { win: 'Ctrl-S', mac: 'Command-S' },
      exec: this.save.bind(this)
    })

    // Handle `esc` to cancel editor changes and close editor
    this.editor.commands.addCommand({
      name: 'cancel',
      bindKey: { win: 'Esc', mac: 'Esc' },
      exec: this.cancel.bind(this)
    })
  }
}