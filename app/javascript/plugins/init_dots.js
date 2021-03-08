import Flicking from "@egjs/flicking";

const initDots = () =>  {
	const wrapper = document.getElementById('pictures_list');
  const pagination = document.querySelector(".pagination");
	if ((wrapper) && (pagination)) {
    const firstDot = pagination.firstElementChild ;
    firstDot.classList.add("selected");
		const flicking = new Flicking("#pictures_list", { circular: true, gap: 10 });
		const dots = [].slice.call(pagination.querySelectorAll(".dot"));
		dots.forEach((dot, i) => {
			dot.addEventListener("move", () => {
				flicking.moveTo(i);
			});
		});
		flicking.on("change", e => {
			const index = e.index;
			dots[flicking.getIndex()].classList.remove("selected");
			dots[index].classList.add("selected");
		});
	}

}
export { initDots };