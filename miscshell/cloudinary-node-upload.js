#!/Users/tyler/.nvm/versions/node/v8.16.0/bin/node

var dotenv = require('dotenv');
dotenv.load();
var fs = require('fs');
var cloudinary = require('cloudinary').v2;

cloudinary.config({ cloud_name: process.env.CLOUD_NAME, api_key: process.env.API_KEY, api_secret: process.env.API_SECRET });

var uploads = {};

cloudinary.uploader.upload('carbon-ex.png', { tags: 'basic_sample' }, function (err, image) {
  if (err) { console.warn(err); }
  console.log("image public_id: " + image.public_id);
  console.log("image url: " + image.url);
  waitForAllUploads("pizza", err, image);
});

function waitForAllUploads(id, err, image) {
  uploads[id] = image;
  let ids = Object.keys(uploads);

  if (ids.length == 6) {
    console.log('**  uploaded all files (' + ids.join(',') + ') to cloudinary');
  }
}
