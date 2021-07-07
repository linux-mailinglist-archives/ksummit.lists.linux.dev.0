Return-Path: <ksummit+bounces-316-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC503BF17E
	for <lists@lfdr.de>; Wed,  7 Jul 2021 23:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 12C0D3E1061
	for <lists@lfdr.de>; Wed,  7 Jul 2021 21:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D55B2F80;
	Wed,  7 Jul 2021 21:43:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C99B168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 21:43:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3654AE7;
	Wed,  7 Jul 2021 23:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625694218;
	bh=7PcDHMRQccBuD1VsTZv5OnUXk56MbEoJRiK1YBrLpGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTUl4DAx/UcFcdwflHYLT+cCl6rbV1mqigyAcunD1mjOHWtj/0K+FsMcCuqj8jMpS
	 /7jgYubOMnPYkJNQ0WaElP/DneuqhhnZn1/Bl9SrSoLP6cNfISgehoxr737Sj3Ahvv
	 ovQuhHhi6Qg5odRD4urVFD8CmLm5X749UgbD95Lc=
Date: Thu, 8 Jul 2021 00:42:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Don Zickus <dzickus@redhat.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <YOYf3c5UPMG4yBVP@pendragon.ideasonboard.com>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210707211951.fyiflsp75i7spcha@redhat.com>

Hi Don,

On Wed, Jul 07, 2021 at 05:19:51PM -0400, Don Zickus wrote:
> Submission #89:
> 
> The Red Hat kernel team recently converted their RHEL workflow from
> PatchWork to GitLab. This talk will discuss what the new workflow looks like
> with integrated CI and reduced emails. New tooling had to be created to
> assist the developer and reviewer. Webhooks were utilized to autoamte as
> much of the process as possible making it easy for a maintainer to track
> progress of each submitted change. Finally using CKI, every submitted change
> has to pass CI checks before it can be merged.
> 
> We faced many challenges especially around reviewing changes. Resolving
> those led to a reduction of email usage and an increase in cli tools. Demos
> of those tools will be included.

If gitlab is used in this context (I'm talking about reviews here, not
CI) as a transport mechanism for structured data handled by CLI tools,
what would prevent us from developing similar tools on top of less
centralized and proprietary transport mechanism ?

> Attendees will leave with an understanding how to convert or supplement
> their workflow with GitLab.

-- 
Regards,

Laurent Pinchart

