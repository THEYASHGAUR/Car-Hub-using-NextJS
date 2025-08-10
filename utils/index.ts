export const updateSearchParams = (type: string, value: string) => {
  // Get the current URL search params
  const searchParams = new URLSearchParams(window.location.search);

  // Set the new param
  searchParams.set(type, value);

  // Construct the new URL
  const newPathname = `${window.location.pathname}?${searchParams.toString()}`;

  return newPathname;
};
