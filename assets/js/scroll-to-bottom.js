let ScrollToBottom = {
  updated() {
    this.el.scrollTo(0, this.el.scrollHeight);
  },
};

export default ScrollToBottom;
