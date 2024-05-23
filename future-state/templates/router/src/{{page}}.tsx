import React from 'react';
import { Route, Switch } from 'react-router-dom';

// Auto-generated imports
{{#each $templates.['@tongal/templates/page'].instances}}
import {{this.variables.name}} from '{{this.meta.location.relative}}';
{{/each}}

export const Router: React.FC = () => {
	return (
		<Switch>
			{/* Auto-generated pages */}
			{{#each $templates.['@tongal/templates/page'].instances}}
				<Route
					exact
					path="{{this.variables.path}}"
					component={{{this.variables.name}}}
				/>
			{{/each}}
		</Switch>
	);
};
