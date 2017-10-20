import ReactOnRails from 'react-on-rails';

import PostListing from '../bundles/App/components/PostListing';
import Gallery from 'react-grid-gallery';

// This is how react_on_rails can see the PostListing in the browser.
ReactOnRails.register({
  PostListing, Gallery
});
