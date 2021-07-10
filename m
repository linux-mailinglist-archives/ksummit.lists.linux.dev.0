Return-Path: <ksummit+bounces-380-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7F3C3728
	for <lists@lfdr.de>; Sun, 11 Jul 2021 00:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 7C75F1C0F41
	for <lists@lfdr.de>; Sat, 10 Jul 2021 22:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FEE2F80;
	Sat, 10 Jul 2021 22:39:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D772
	for <ksummit@lists.linux.dev>; Sat, 10 Jul 2021 22:39:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A71A8255;
	Sun, 11 Jul 2021 00:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625956759;
	bh=61Ml/TU1lnftvB4KyY6S9Cn4Wt9p5S198duyhxrr+oM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPMmmnITmXlDSPXGYe2GeET72hezOW2bKVV4OluEM3ySU9vPvFFuCFJM/hXYXfw3g
	 tHdApHLNbLeWQn2gxu8rO6HmSG4wjYt1JKYbVkO+rQu8T3AGItAK00IN2i0iANXpsp
	 vUsRt2JSktTuSH5qGpk08ItYvii2RrKGUjQK2lYo=
Date: Sun, 11 Jul 2021 01:38:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Don Zickus <dzickus@redhat.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <YOohaRa7OWO88Mub@pendragon.ideasonboard.com>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
 <YOYf3c5UPMG4yBVP@pendragon.ideasonboard.com>
 <20210707222728.jocrxvqogwjd5ozx@redhat.com>
 <YOYtURGM6VDnOrH9@pendragon.ideasonboard.com>
 <20210708210436.apvu2isib67cmuee@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210708210436.apvu2isib67cmuee@redhat.com>

Hi Don,

On Thu, Jul 08, 2021 at 05:04:36PM -0400, Don Zickus wrote:
> On Thu, Jul 08, 2021 at 01:40:17AM +0300, Laurent Pinchart wrote:
> > > If as a reviewer you want to see:
> > > * all patches that touch files/directories X, Y, Z
> > > * all discussions around those patches
> > > * who has approved the patch
> > > * who is blocking the patch
> > > * has it passed CI
> > > * other details
> > > 
> > > then the tool just calls whatever api to whatever tool to put all that
> > > together and present it to you.  GitLab structured data in a way to allow us
> > > to rethink things and we built a tool around this new approach.  I am sure
> > > it can't be that hard to abstract further and extend it to other tools if
> > > that is interesting.
> > 
> > In that workflow, how does a reviewer enter review data ? Does it have
> > to go through the gitlab web UI, or do you have alternate means through
> > CLI tools and/or e-mail bridges ?
> 
> Currently we are using an email bridge as the tool stabilizes and GitLab
> resolves some of the quirks we have identified.  But our email bridge stats
> show very few developers are using email as most have migrated to the cli
> tools.
> 
> > One particular shortcoming of gitlab that I've noticed is that it
> > doesn't seem to be possible to comment inline on a commit message. I
> > don't know if it's a limitation of the UI only, or if the protocol and
> > data formats also don't support that. Good commit messages are very
> > important, and I believe a tool that doesn't let me comment on how to
> > improve a commit message could cause the overall quality of the
> > development to decrease over time. Have you noticed the same
> > shortcoming, and if so, have you found ways to address it ?
> 
> Yes and we raised it with GitLab.  We will work with them to see if it is
> possible to fix this year.
> 
> > > Email workflow works great.  But as PatchWork showed us, there are some
> > > extra details or tracking that is interesting to some folks.  With GitLab we
> > > extend this a little further.
> > > 
> > > It really depends on what you want to see when you review a patch.
> > 
> > E-mail is very limited by itself when it comes to tracking information.
> > Services like patchwork help there, but they're limited by the fact that
> > data isn't structured. Services such as git..b have an advantage in that
> > front. When it comes to doing the actual review, however, I believe the
> > situation is the opposite. I'm dreaming of a way to move our e-mail
> > workflow from unstructured to structured data in order to get the best
> > of both worlds, with services that can then subscribe to the mailing
> > lists (which are really transport mechanisms) to gather data and expose
> > it in useful ways. I have high hopes that the work done by Konstantin
> > and others will bring us in that direction.
> 
> Yes, we are still tweaking our workflow too, to find that balance for
> collaboration between ease-of-use (email) and structured data (gitlab).

I'd put this slightly differently. E-mail doesn't bring ease of use by
itself. What I really want to keep from the e-mail workflow is the
following features.

- A single client where I can do all my review. With web-based UIs for
  forges, you have to log in every forge for every project you work on.
  That's one for github, one for gitlab, one for each self-hosted github
  or gitlab instance (fd.o has a self-hosted public gitlab instance,
  it's also common for large companies to have self-hosted private
  instances), and I'm not counting gerrit instances or other forges.
  It's painful, I want not only to get all the notifications in a single
  client (that's already possible with e-mail notifications) but handle
  review in a single client too.

- The ability to easily extend and customize my workflow. With web-based
  UIs, flexibility is very limited (there are APIs that allow developing
  applications to perform customization, but that's a heavy process).
  With e-mail clients, developers can pick their own clients and
  customize the workflow as they want.

Furthermore, I don't think structured data needs to be limited to
forges. Structured data can be transported over e-mail, or other
transport protocols, what we're missing is clients that could interpret
them correctly.

> We even have a public-inbox prototype that connects with the GitLab API and
> allows you to reply with some mutt hacking.  Not sure if that is a useful
> direction for you.
> 
> But yes, internally, patch review has been our most discussed topic.

-- 
Regards,

Laurent Pinchart

