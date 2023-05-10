import { getAttributeOrThrow } from "../lib/attribute";
import ApexCharts from "apexcharts";

export default {
    mounted() {
        this.props = getProps(this);

        this.handleEvent(`apex:${this.props.id}:init`, ({ spec }) => {
            var chart = new ApexCharts(this.el, spec);
            chart.render();
        });
    }
};

function getProps(hook) {
    return {
        id: getAttributeOrThrow(hook.el, "data-id"),
    };
}