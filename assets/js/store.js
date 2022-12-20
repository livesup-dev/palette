//TODO: We have to get rid of this file
export default {
  isDarkModeEnabled: false,
  isMonochromeModeEnabled: false,
  isSearchbarActive: false,
  isSidebarExpanded: false,
  isRightSidebarExpanded: false,
  currentLocation: currentLocation(),
  init() {
    let firstTime = true;

    this.isDarkModeEnabled = Alpine.$persist(false).as("_x_darkMode_on");

    this.isSidebarExpanded =
      document.querySelector(".sidebar") &&
      document.body.classList.contains("is-sidebar-open") &&
      Alpine.store("breakpoints").xlAndUp;

    Alpine.effect(() => {
      this.isDarkModeEnabled
        ? document.documentElement.classList.add("dark")
        : document.documentElement.classList.remove("dark");
    });

    Alpine.effect(() => {
      this.isMonochromeModeEnabled
        ? document.body.classList.add("is-monochrome")
        : document.body.classList.remove("is-monochrome");
    });

    Alpine.effect(() => {
      this.isSidebarExpanded
        ? document.body.classList.add("is-sidebar-open")
        : document.body.classList.remove("is-sidebar-open");
    });

    Alpine.effect(() => {
      if (Alpine.store("breakpoints").name && !firstTime) {
        this.isSidebarExpanded = false;
        this.isRightSidebarExpanded = false;
      }
    });

    Alpine.effect(() => {
      if (Alpine.store("breakpoints").smAndUp) this.isSearchbarActive = false;
    });

    firstTime = false;
  },

  documentBody: {
    ["@load.window"]() {
      const preloader = document.querySelector(".app-preloader");
      if (!preloader) return;
      setTimeout(() => {
        preloader.classList.add(
          "animate-[cubic-bezier(0.4,0,0.2,1)_fade-out_500ms_forwards]"
        );
        setTimeout(() => preloader.remove(), 1000);
      }, 150);
    },
  },
};

function currentLocation() {
  return [location.protocol, "//", location.host, location.pathname].join("");
}
