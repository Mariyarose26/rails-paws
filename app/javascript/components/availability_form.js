const initAvailabilityDropdown = () => {
  const availabilityDropdown = document.getElementById('availability-dropdown');
  if (availabilityDropdown) {
    availabilityDropdown.addEventListener('change', (event) => {
      // grab the selected value
      // depending on value (hide or show other fields)
      const availability = document.querySelector(".availability-fields");
      const value = event.currentTarget.value
      if (value != "Available") {
        availability.style.display = "none";
      } else {
        availability.style.display = "";
      }
    })
  }
}

export { initAvailabilityDropdown }
