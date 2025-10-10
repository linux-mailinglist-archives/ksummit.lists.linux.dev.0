Return-Path: <ksummit+bounces-2482-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D8BBCD7F2
	for <lists@lfdr.de>; Fri, 10 Oct 2025 16:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D883835652C
	for <lists@lfdr.de>; Fri, 10 Oct 2025 14:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7511F3FED;
	Fri, 10 Oct 2025 14:21:14 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA2B260578
	for <ksummit@lists.linux.dev>; Fri, 10 Oct 2025 14:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760106074; cv=none; b=XwNu0TV+5QNNdtnWGg8PXXxQMHJI/aO6lMFcOJxXLm3WUukJvpJVmmCzun69FXiCaq6G+J4QTrViLjQruMGBzhCm5vLnTmtTFh/2Y8AkLgdwDALbNoOO+njBrVI7Jz1mKjHuRNzhgA5advOpFqP/UDEDQI7fShqOG9cfG9oL9fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760106074; c=relaxed/simple;
	bh=vpgl9VKNszAfwceLtFmOyBxzdwOgS8o8nsR81+HyHmk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NBLE+Hfzp3+av1n4m2D1ywK6HeLqx8nnxkVSdAbDHKYzAoZJka9l2zSxdX8lS/68R0dSkCmxqTBMSvFyYUbos1z69W5ai3h1jEydkZmgqm2revfCrnqqj4oAd8ibRRPj4qKxysKvOPSi3zslpmIl88IZa0D3KxpUH+4T8eUFPPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 3F46CC0368;
	Fri, 10 Oct 2025 14:21:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 151B322;
	Fri, 10 Oct 2025 14:21:01 +0000 (UTC)
Date: Fri, 10 Oct 2025 10:21:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Chris Mason
 <clm@meta.com>, "Bird, Tim" <Tim.Bird@sony.com>, Andrew Lunn
 <andrew@lunn.ch>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Dan
 Carpenter <dan.carpenter@linaro.org>, Alexei Starovoitov <ast@kernel.org>,
 Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <20251010102104.65eb6431@gandalf.local.home>
In-Reply-To: <20251010115334.GB28598@pendragon.ideasonboard.com>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
	<fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
	<20251008192934.GH16422@pendragon.ideasonboard.com>
	<MW5PR13MB5632D8B5B656E1552B21159FFDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<d08330417052c87b58b4a9edd4c0e8602e4061f2.camel@HansenPartnership.com>
	<MW5PR13MB5632FC46AD54998C4C584F91FDE1A@MW5PR13MB5632.namprd13.prod.outlook.com>
	<20251009091405.GD12674@pendragon.ideasonboard.com>
	<d4f98276-ab5d-43ca-9662-017420154e4a@meta.com>
	<20251010075413.GD29493@pendragon.ideasonboard.com>
	<3996fd684c497c7bcb4ad406ff3cec99df7180df.camel@HansenPartnership.com>
	<20251010115334.GB28598@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: du15i4t85u1mp3d18k18j9j5mem8ouhn
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 151B322
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18Hyrz2g37ELeuA8vL5dYb4ZTADakz+cGs=
X-HE-Tag: 1760106061-680594
X-HE-Meta: U2FsdGVkX1/x2fMoGiCZDDgAkq4IMFtIgdrx9mBDEX+rapw73EpEBknMidJSGI649sCT9knaz9C1IyXAmHDM1fk4lpGHuvIHnUWNsxWAeJQojJcB30uZ8xqQXEOZjpX8142Xz5cwwvTNEIgqj2fm02X4U16qBsJMfoFsKmNJiu3ZlTrTDVIAffEzPYgPCujuqIWAcgwvQFYPX0MhM2bC8mxw1Ldx9OLnPKenlH4zt0115I5s1TGyU/JD9JsuxrlIFEahZpJB3Vp/5AvqxN3RJLaplRIYLryA4+mUw83f1jhMr651B1K4MhmOXnyQj9P3wxpxkm4u9MknSY0e8B4n0Vndo1pG0d2mtezifc1mcuNPZZzqV0vsq4HJfnbOp+F6

On Fri, 10 Oct 2025 14:53:34 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > 
> > This is pre-supposing that AI will always be proprietary.  Given the
> > vast expansion of open source over the last couple of decades I
> > wouldn't take that bet.  
> 
> I wouldn't bet either way, but I tend to play it safe. I wouldn't want
> to go in the direction of relying on proprietary technologies based
> solely on the hope that at some point in the future we will get free
> alternatives. I'm absolutely fine if people want to start experimenting
> now based on that assumption, as long as we make it clear it's too early
> to cross a point of no return.

If it's just in CI, I don't think we need to worry too much for proprietary
lock in. It's currently a "nice to have". That is, we can catch issues of
submissions faster and hopefully maintainers do not need to waste time on
reviewing bugs in a patch that an AI caught. If it sends the report to the
submitter and also Cc's the maintainer, it would benefit both. I find
reading a review from someone else (and verifying it) much easier than
doing the review myself ;-)

> 
> > > If we were to push the burden of running LLM-based review to
> > > contributors this wouldn't affect us that much, but if we run it on
> > > the maintainers' side (be it on the server side with bots that get
> > > patches from mailing lists, CI systems that feed from patchwork, or
> > > on the client side) the risk of vendor lock-in is higher.  
> > 
> > Pushing the burden on to contributors always causes more friction than
> > building it into the CI.  Plus if there's a cost involved you're making
> > contribution pay for play which really doesn't work out well.  
> 
> Neither side is ideal :-/ Given all the arguments given in this thread I
> think we would need to run checks on the maintainer side in any case,
> even if we were to try and push them to the developer side. For that
> reason it makes sense to first focus on the maintainer side, and try to
> solve the technical, financial and freedom issues there as we'll have to
> anyway.
> 
> As for pay-for-play, let's discuss a tax on upstream contributions
> around a bottle of nihonshu at LPC. That topic requires not being sober
> :-)

I'd like to be part of this "discussion" ;-)

> 
> > >  Maybe proprietary technology lock-in would be a better description
> > > as this isn't about a single vendor.  
> > 
> > Well, firstly we've had this before: us with bitkeeper and most
> > recently Kubernetes with Slack and everyone has survived. But secondly
> > the far more likely scenario is that the AI stock bubble bursts and the
> > investment dries up changing the way AI is done (definitely killing the
> > who can by powerstations and huge hardware installations model of
> > today) and who the players are (probably the point at which open source
> > becomes more prevalent).  
> 
> I'd love to fast-track to that and skip the current tragicomedy.
> 
> > However, regardless of what happens in future, it will be way easier to
> > cope with if we've got AI in the CI rather than trying to push it into
> > contributor tooling.  

100% agree

-- Steve


