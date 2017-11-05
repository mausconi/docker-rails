import React from 'react';
import PropTypes from 'prop-types';
import sanitizeHtml from 'sanitize-html';
import TimeAgo from 'react-timeago';

export default class PostRow extends React.Component {
  static propTypes = {
    post: PropTypes.object.isRequired
  };

  constructor (props) {
    super(props)

    this.state = {
      formatted_content: this.formatted_content(),
    }
  }

  formatted_content() {
    let icon = null;
    if (parseInt(this.props.post.clips_count) > 0) {
      icon = <i className="fa fa-picture-o" />
    }

    return (
      <span>
        {icon} <strong>{this.props.post.title}</strong> {this.props.post.content}
      </span>
    );
  }

  handleRowClick = (e) => {
    const href = e.currentTarget.getAttribute('data-href');
    Turbolinks.visit(href);
  }

  render() {
    return (
      <tr onClick={this.handleRowClick} data-href={this.props.post.url}>
        <td className="js-row-link">{this.state.formatted_content}</td>
        <td className="js-row-link text-right d-none d-md-table-cell text-nowrap">
          <span className="badge badge-secondary">
            <TimeAgo date={this.props.post.updated_at} />
          </span>
        </td>
      </tr>
    );
  }
}
