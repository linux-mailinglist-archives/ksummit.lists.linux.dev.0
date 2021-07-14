Return-Path: <ksummit+bounces-387-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 0463F3C94A5
	for <lists@lfdr.de>; Thu, 15 Jul 2021 01:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 319B71C0E16
	for <lists@lfdr.de>; Wed, 14 Jul 2021 23:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59FC2F80;
	Wed, 14 Jul 2021 23:47:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E5D72
	for <ksummit@lists.linux.dev>; Wed, 14 Jul 2021 23:47:11 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29B66A24;
	Thu, 15 Jul 2021 01:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1626306429;
	bh=PR2ZFdsQnnd/s0kup0wJjwmc4kAVo/tGyJ/JEm2ILKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gw5H9PNei15hzGfv+FEFid276EC6EjE3YKClWfXjJk9mqIt0O7ar3GAgJFj42K7q6
	 5Ms6iZEKEXtvGAayNC+cKVskm3vKOPsCucfl9ff6FI1b5D3uivgJH9LxIwP27QN69b
	 L56l1Bn/FgodLjvD5IRZpFiGQsAUfivU1JI7f11k=
Date: Thu, 15 Jul 2021 02:47:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Don Zickus <dzickus@redhat.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <YO93e9tTMfFwupHy@pendragon.ideasonboard.com>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
 <YOYf3c5UPMG4yBVP@pendragon.ideasonboard.com>
 <20210707222728.jocrxvqogwjd5ozx@redhat.com>
 <YOYtURGM6VDnOrH9@pendragon.ideasonboard.com>
 <20210708210436.apvu2isib67cmuee@redhat.com>
 <YOohaRa7OWO88Mub@pendragon.ideasonboard.com>
 <20210712135835.qgh7u5f7p2oy7cp5@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210712135835.qgh7u5f7p2oy7cp5@redhat.com>

Hi Don,

On Mon, Jul 12, 2021 at 09:58:35AM -0400, Don Zickus wrote:
> On Sun, Jul 11, 2021 at 01:38:33AM +0300, Laurent Pinchart wrote:
> > > Yes, we are still tweaking our workflow too, to find that balance for
> > > collaboration between ease-of-use (email) and structured data (gitlab).
> > 
> > I'd put this slightly differently. E-mail doesn't bring ease of use by
> > itself. What I really want to keep from the e-mail workflow is the
> > following features.
> > 
> > - A single client where I can do all my review. With web-based UIs for
> >   forges, you have to log in every forge for every project you work on.
> >   That's one for github, one for gitlab, one for each self-hosted github
> >   or gitlab instance (fd.o has a self-hosted public gitlab instance,
> >   it's also common for large companies to have self-hosted private
> >   instances), and I'm not counting gerrit instances or other forges.
> >   It's painful, I want not only to get all the notifications in a single
> >   client (that's already possible with e-mail notifications) but handle
> >   review in a single client too.
> 
> The biggest hurdle for reviews I see is un-authenticated email sent to an
> autenticated forge.  Currently we have an email-bridge bot that copies
> comments from a trusted mailing list to the forge but it is clear that the
> comment is using the authenticated bot.
> 
> Some forges use an embedded personal token in the reply-to field to work
> around this.  But it restricts collaboration in my opinion.
> 
> But I agree with your perspective.
> 
> > - The ability to easily extend and customize my workflow. With web-based
> >   UIs, flexibility is very limited (there are APIs that allow developing
> >   applications to perform customization, but that's a heavy process).
> >   With e-mail clients, developers can pick their own clients and
> >   customize the workflow as they want.
> 
> Internally for reviewers, there are two popular use-cases.  The traditional
> collaboration about the patches as you suggested and the
> what-patches-need-my-attention.  As RHEL is more backport heavy (leaving
> technical collaboration for upstream), we have focused more on the latter
> use case, hence our tooling effort.
> 
> The former use-case is still a concern and various developers are working on
> ideas to make it easier.  Suggestions like yours are welcomed.
> 
> > 
> > Furthermore, I don't think structured data needs to be limited to
> > forges. Structured data can be transported over e-mail, or other
> > transport protocols, what we're missing is clients that could interpret
> > them correctly.
> 
> Ok.  Let's say I have a couple of developers that can tweak gitlab emails to
> try new ideas.  I assume X-labels only go so far.  What other thoughts do
> you have that we might play around with?

One idea I've been thinking about (and it's probably not a very good
one, but maybe someone can think of a way to make it better) is to
create a structured format very similar to regular e-mails. It would be
readable by humans in a normal e-mail client, and wouldn't break when
replying if enough care was taken by the responder (assuming an e-mail
client that is not inherently completely broken). Any bad reply would
break the flow, but "good" replies wouldn't. With this as a starting
point, we could start developping support in e-mail clients (I'm
selfishly thinking about mutt in particular, but I can imagine a few
other open-source clients doing the same) and text editors (for clients
that use external editors) to interpret the structured data and generate
correct replies without relying on the user doing the work themselves.
This could give us a path towards a gradual transition. Forges that
receive broken replies could possibly also implement heuristics to still
make sense of the replies (to some extent at least), possibly only in a
transitory period.

Now that I've explained my bad idea, does anyone think of a way to turn
it into a good idea ? :-)

> > > We even have a public-inbox prototype that connects with the GitLab API and
> > > allows you to reply with some mutt hacking.  Not sure if that is a useful
> > > direction for you.
> > > 
> > > But yes, internally, patch review has been our most discussed topic.

-- 
Regards,

Laurent Pinchart

