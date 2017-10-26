function submitForm() {
   var form = document.getElementsByName('report-form')[0];
   form.submit(); // Submit the form
   form.reset();  // Reset all form data
   return false; // Prevent page refresh
}
