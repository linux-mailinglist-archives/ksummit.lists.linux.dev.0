Return-Path: <ksummit+bounces-320-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE343BF228
	for <lists@lfdr.de>; Thu,  8 Jul 2021 00:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 271181C0E3B
	for <lists@lfdr.de>; Wed,  7 Jul 2021 22:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665982FAD;
	Wed,  7 Jul 2021 22:41:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342EB70
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 22:41:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9C49CC;
	Thu,  8 Jul 2021 00:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625697661;
	bh=zaZLRI8yikCkYJA92M1YYZFJi94RCzYZqc7xiIGnWhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7LvTr4cvd6A28OUmCz8O0T6MleSR27xRrpQQH9HvPuzTe3p9sTn40U6DtyMm0Rc/
	 46/wyVREyBPctKtF7DoFYWmUjA1Zq2uvIc30QDPvihsTKThuSPluqwMsKjJerJBPRx
	 SwHmnPb+R8wYHB+ucHMIUkj4+tzm5yREkvEvOdSc=
Date: Thu, 8 Jul 2021 01:40:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Don Zickus <dzickus@redhat.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <YOYtURGM6VDnOrH9@pendragon.ideasonboard.com>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
 <YOYf3c5UPMG4yBVP@pendragon.ideasonboard.com>
 <20210707222728.jocrxvqogwjd5ozx@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210707222728.jocrxvqogwjd5ozx@redhat.com>

Hi Don,

On Wed, Jul 07, 2021 at 06:27:28PM -0400, Don Zickus wrote:
> On Thu, Jul 08, 2021 at 12:42:53AM +0300, Laurent Pinchart wrote:
> > On Wed, Jul 07, 2021 at 05:19:51PM -0400, Don Zickus wrote:
> > > Submission #89:
> > > 
> > > The Red Hat kernel team recently converted their RHEL workflow from
> > > PatchWork to GitLab. This talk will discuss what the new workflow looks like
> > > with integrated CI and reduced emails. New tooling had to be created to
> > > assist the developer and reviewer. Webhooks were utilized to autoamte as
> > > much of the process as possible making it easy for a maintainer to track
> > > progress of each submitted change. Finally using CKI, every submitted change
> > > has to pass CI checks before it can be merged.
> > > 
> > > We faced many challenges especially around reviewing changes. Resolving
> > > those led to a reduction of email usage and an increase in cli tools. Demos
> > > of those tools will be included.
> > 
> > If gitlab is used in this context (I'm talking about reviews here, not
> > CI) as a transport mechanism for structured data handled by CLI tools,
> > what would prevent us from developing similar tools on top of less
> > centralized and proprietary transport mechanism ?
> 
> Nothing I think.  It is just api calls around abstract pieces of a review
> process.
> 
> If as a reviewer you want to see:
> * all patches that touch files/directories X, Y, Z
> * all discussions around those patches
> * who has approved the patch
> * who is blocking the patch
> * has it passed CI
> * other details
> 
> then the tool just calls whatever api to whatever tool to put all that
> together and present it to you.  GitLab structured data in a way to allow us
> to rethink things and we built a tool around this new approach.  I am sure
> it can't be that hard to abstract further and extend it to other tools if
> that is interesting.

In that workflow, how does a reviewer enter review data ? Does it have
to go through the gitlab web UI, or do you have alternate means through
CLI tools and/or e-mail bridges ?

One particular shortcoming of gitlab that I've noticed is that it
doesn't seem to be possible to comment inline on a commit message. I
don't know if it's a limitation of the UI only, or if the protocol and
data formats also don't support that. Good commit messages are very
important, and I believe a tool that doesn't let me comment on how to
improve a commit message could cause the overall quality of the
development to decrease over time. Have you noticed the same
shortcoming, and if so, have you found ways to address it ?

> Email workflow works great.  But as PatchWork showed us, there are some
> extra details or tracking that is interesting to some folks.  With GitLab we
> extend this a little further.
> 
> It really depends on what you want to see when you review a patch.

E-mail is very limited by itself when it comes to tracking information.
Services like patchwork help there, but they're limited by the fact that
data isn't structured. Services such as git..b have an advantage in that
front. When it comes to doing the actual review, however, I believe the
situation is the opposite. I'm dreaming of a way to move our e-mail
workflow from unstructured to structured data in order to get the best
of both worlds, with services that can then subscribe to the mailing
lists (which are really transport mechanisms) to gather data and expose
it in useful ways. I have high hopes that the work done by Konstantin
and others will bring us in that direction.

-- 
Regards,

Laurent Pinchart

