const Targeting = Vue.createApp({
    data() {
        return {
            Show: false,
            ChangeTextIconColor: false, // This is if you want to change the color of the icon next to the option text with the text color
            StandardEyeIcon: "far fa-eye",
            CurrentIcon: "far fa-eye",
            SuccessColor: "rgb(30,144,255)",
            StandardColor: "white",
            TargetHTML: "",
            TargetEyeStyleObject: {
                color: "white", // This is the standardcolor, change this to the same as the StandardColor if you have changed it
            },
        }
    },
    destroyed() {
        window.removeEventListener("message", this.messageListener);
        window.removeEventListener("mousedown", this.mouseListener);
        window.removeEventListener("keydown", this.keyListener);
    },
    mounted() {
        this.messageListener = window.addEventListener("message", (event) => {
            switch (event.data.response) {
                case "openTarget":
                    this.OpenTarget();
                    break;
                case "closeTarget":
                    this.CloseTarget();
                    break;
                case "foundTarget":
                    this.FoundTarget(event.data);
                    break;
                case "validTarget":
                    this.ValidTarget(event.data);
                    break;
                case "leftTarget":
                    this.LeftTarget();
                    break;
            }
        });

        this.mouseListener = window.addEventListener("mousedown", (event) => {
            let element = event.target;
            let split = element.id.split("-");
            if (split[0] === 'target' && split[1] !== 'eye') {
                $.post(`https://${GetParentResourceName()}/selectTarget`, JSON.stringify(Number(split[1]) + 1));
                this.TargetHTML = "";
                this.Show = false;
            }

            if (event.button == 2) {
                this.CloseTarget();
                $.post(`https://${GetParentResourceName()}/closeTarget`);
            }
        });
        this.keyListener = window.addEventListener("keydown", (event) => {
            if (event.key == 'Escape' || event.key == 'Backspace') {
                this.CloseTarget();
                $.post(`https://${GetParentResourceName()}/closeTarget`);
            }
        });
    },
    methods: {
        OpenTarget() {
            this.TargetHTML = "";
            this.Show = true;
            this.TargetEyeStyleObject.color = this.StandardColor;
        },
        CloseTarget() {
            this.TargetHTML = "";
            this.TargetEyeStyleObject.color = this.StandardColor;
            this.Show = false;
            this.CurrentIcon = this.StandardEyeIcon;
        },
        FoundTarget(item) {
            if (item.data) {
                this.CurrentIcon = item.data;
            } else {
                this.CurrentIcon = this.StandardEyeIcon;
            }
            this.TargetEyeStyleObject.color = this.SuccessColor;
        },
        ValidTarget(item) {
            this.TargetHTML = "";
            let TargetLabel = this.TargetHTML;
            const FoundColor = this.SuccessColor;
            const ResetColor = this.StandardColor;
            const AlsoChangeTextIconColor = this.ChangeTextIconColor;
            const items = item.data;
            items.forEach(function(item, index) {
                if (AlsoChangeTextIconColor) {
                    TargetLabel = "<div id='target-" + index + "' style='margin-bottom: 1vh;'><span id='target-icon-" + index + "'><i class='" + item.icon + "'></i></span>&nbsp" + item.label + "</div>" + TargetLabel;
                } else {
                    TargetLabel = "<div id='target-" + index + "' style='margin-bottom: 1vh;'><span id='target-icon-" + index + "' style='color: " + FoundColor + "'><i class='" + item.icon + "'></i></span>&nbsp" + item.label + "</div>" + TargetLabel;
                };

                setTimeout(function() {

                    const hoverelem = document.getElementById("target-" + index);

                    hoverelem.addEventListener('mouseenter', function(event) {
                        event.target.style.color = FoundColor;
                        if (AlsoChangeTextIconColor) {
                            document.getElementById("target-icon-" + index).style.color = FoundColor;
                        };
                    });

                    hoverelem.addEventListener('mouseleave', function(event) {
                        event.target.style.color = ResetColor;
                        if (AlsoChangeTextIconColor) {
                            document.getElementById("target-icon-" + index).style.color = ResetColor;
                        };
                    });
                }, 5)
            });
            this.TargetHTML = TargetLabel;
        },
        LeftTarget() {
            this.TargetHTML = "";
            this.CurrentIcon = this.StandardEyeIcon;
            this.TargetEyeStyleObject.color = this.StandardColor;
        }
    }
});

Targeting.use(Quasar, {
    config: {
        loadingBar: { skipHijack: true }
    }
});
Targeting.mount("#target-wrapper");
