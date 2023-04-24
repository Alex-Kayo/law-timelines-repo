function zoomMermaidWrapper(root) {
    //Mapael attempt which doesn't work yet

    /*const container = $("#" + root).parent();

    const containerWidth = container.width();
      const containerHeight = containerWidth * (2 / 3);

      // Initialize Mapael
      container.mapael({
          map: {
              name: "ukraine",
              width: 500,
              height: 500
          },
          areas: {
              "area1": {
                  attrs: {
                      fill: "#ff0000"
                  },
                  tooltip: {
                      content: "Area 1"
                  }
              },
              "area2": {
                  attrs: {
                      fill: "#00ff00"
                  },
                  tooltip: {
                      content: "Area 2"
                  }
              }
          },
          zoom: {
              enabled: true,
              step: 0.1,
              maxLevel: 2,
          },
      });

      // Move the SVG element into the Mapael container
      const svgElement = document.querySelector(`#${root} > svg`);
      const mapaelContainer = document.querySelector(".map-container");
      mapaelContainer.appendChild(svgElement);

      // Adjust the viewBox of the Mapael container to match the original SVG viewBox
      const viewBox = "0 0 500 500"; // Replace this with the original viewBox of your SVG
      mapaelContainer.setAttribute("viewBox", viewBox);*/

    // vanilla JS approach
    const container = document.getElementById(root);
    const svg = document.querySelector(`#${root} svg`);
    console.log(container);
    console.log(svg);

    let transformMatrix = [1, 0, 0, 1, 0, 0]; // [scaleX, skewY, skewX, scaleY, translateX, translateY]

    container.addEventListener("wheel", (e) => {
        e.preventDefault();

        const scaleFactor = e.deltaY < 0 ? 1.1 : 0.9;
        const scalePointX = e.clientX - container.getBoundingClientRect().left;
        const scalePointY = e.clientY - container.getBoundingClientRect().top;

        const newScaleX = transformMatrix[0] * scaleFactor;
        const newScaleY = transformMatrix[3] * scaleFactor;

        // Limit zoom to 100%-400% of container size
        if (newScaleX >= 1 && newScaleX <= 4 && newScaleY >= 1 && newScaleY <= 4) {
            transformMatrix[0] = newScaleX;
            transformMatrix[3] = newScaleY;

            transformMatrix[4] += (1 - scaleFactor) * scalePointX;
            transformMatrix[5] += (1 - scaleFactor) * scalePointY;

            checkBoundsAndUpdateSvgTransform();
        }
    });

    let dragging = false;
    let dragStart = { x: 0, y: 0 };

    container.addEventListener("mousedown", (e) => {
        dragging = true;
        dragStart.x = e.clientX;
        dragStart.y = e.clientY;
    });

    container.addEventListener("mousemove", (e) => {
        if (dragging) {
            const translateX = e.clientX - dragStart.x;
            const translateY = e.clientY - dragStart.y;

            transformMatrix[4] += translateX;
            transformMatrix[5] += translateY;

            dragStart.x = e.clientX;
            dragStart.y = e.clientY;

            checkBoundsAndUpdateSvgTransform();
        }
    });

    container.addEventListener("mouseup", () => {
        dragging = false;
    });

    container.addEventListener("mouseleave", () => {
        dragging = false;
    });

    function checkBoundsAndUpdateSvgTransform() {
        const containerBounds = container.getBoundingClientRect();
        const svgBounds = svg.getBoundingClientRect();

        // Check left boundary
        if (svgBounds.left > containerBounds.left) {
            transformMatrix[4] -= svgBounds.left - containerBounds.left;
        }

        // Check top boundary
        if (svgBounds.top > containerBounds.top) {
            transformMatrix[5] -= svgBounds.top - containerBounds.top;
        }

        // Check right boundary
        if (svgBounds.right < containerBounds.right) {
            transformMatrix[4] += containerBounds.right - svgBounds.right;
        }

        // Check bottom boundary
        if (svgBounds.bottom < containerBounds.bottom) {
            transformMatrix[5] += containerBounds.bottom - svgBounds.bottom;
        }

        updateSvgTransform();
    }

    function updateSvgTransform() {
        svg.style.transform = `matrix(${transformMatrix.join(",")})`;
    }
}