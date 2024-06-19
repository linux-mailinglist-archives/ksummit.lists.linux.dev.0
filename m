Return-Path: <ksummit+bounces-1329-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF55F90F77E
	for <lists@lfdr.de>; Wed, 19 Jun 2024 22:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597891F23BD3
	for <lists@lfdr.de>; Wed, 19 Jun 2024 20:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B33415538A;
	Wed, 19 Jun 2024 20:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NE/fMRvr"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106905588F
	for <ksummit@lists.linux.dev>; Wed, 19 Jun 2024 20:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718828757; cv=none; b=eLPnOQken1CdqddCQi1uzYBYLv0oOqrKGEWD5XXSGYTRnrbPH/ampv/AQAU6YXwVo0zzR2ASWCK3lmFJ2hzkY6OYfSxGaTGII+ReWmk4QdS8vIHJHq0c5JCtAZ+HLR5dOmTCzf1CD5Sh/kraPS1omnNbh4TkzOlF7pyV+fQuSV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718828757; c=relaxed/simple;
	bh=5uS+lBm1obVOfHcH9agHF0u60a26TP7AfzNlsrWlGg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxPNIVpQUyGhzhc/QE/xw1gR91J3Xwa0nrZ2yIcCE8ReHTjbAbdLpkIatgjYcke814FxgVX4na+EWHsILrODppto00wCC5QlpK98QWcTYs4Ee5TrWuYW8ipXzZUpVcLuWGkyhYlEPJwP8ZAT8qhn+s4fVk2h9DOp3TAh1HawRU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NE/fMRvr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 871CF18D;
	Wed, 19 Jun 2024 22:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718828735;
	bh=5uS+lBm1obVOfHcH9agHF0u60a26TP7AfzNlsrWlGg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NE/fMRvrL4tJyfh8I8yGLpiMeMC6+dLj3wFNBfD95acbafQ/YQVYg4++4RPABeM6U
	 l5KPQsT5w+/GEtEiGDTI6EMByKmL+7InO2xNKznyYL6d/5Hple8cwsVUCYUNZd4iVL
	 W5yXrdHiS1IUcTBEWNqiw4qGQT8fSpzri5Wa4xGA=
Date: Wed, 19 Jun 2024 23:25:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Mark Brown <broonie@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [3/4] Elevate handling of regressions that
 made it to releases deemed for end users
Message-ID: <20240619202531.GE31507@pendragon.ideasonboard.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <55e89d2c-fa25-4daa-805e-5aca31b321bf@leemhuis.info>
 <20240613113455.GH6019@pendragon.ideasonboard.com>
 <nycvar.YFH.7.76.2406131336450.24940@cbobk.fhfr.pm>
 <ZmxPPH2PSxoryu11@finisterre.sirena.org.uk>
 <635e47c6-c2ce-4a5b-9957-6efcdcfe2f00@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <635e47c6-c2ce-4a5b-9957-6efcdcfe2f00@leemhuis.info>

On Tue, Jun 18, 2024 at 02:58:38PM +0200, Thorsten Leemhuis wrote:
> On 14.06.24 16:10, Mark Brown wrote:
> > On Thu, Jun 13, 2024 at 01:39:00PM +0200, Jiri Kosina wrote:
> >> On Thu, 13 Jun 2024, Laurent Pinchart wrote:
> > 
> >>> I don't think piling pressure will help. What could help is to reduce
> >>> pressure on already overloaded maintainers, to give them more time to
> >>> handle regressions. There have been multiple discussions about
> >>> co-maintainance models over the past few years, and some subsystems are
> >>> (slowly) moving forward. I would be more interested in participating in
> >>> that effort. 
> > 
> >> Fully agreed. That's exactly why a few days ago I proposed the topic about 
> >> exploring the options of making the merge tree more deep (by delegating 
> >> more and making the co-maintainership model more prominent), as that in my 
> >> view is the only available solution to the current maintainer pressure 
> >> problem.
> > 
> > In my experience deeper maintainer trees are often a factor in slowing
> > down patches, passing things between maintainers often just inherently
> > adds delays even if nobody goes on holiday or whatever.  
> 
> From what I see from the regressions perspective they are not ideal
> either. The slow down is one problem, unless the process is streamlined
> well. Another one from my biased point of view seems to be that a few of
> are far away from Linus and apparently not fully aware how he wants
> regressions to be handled.
> 
> Which is not really surprising, as over the years there were quite a few
> cases where maintainers of core subsystems were not handled well either.
> But sooner or later that resulted in a clash with Linus[1] and from then
> on things worked better. For many sub-subsystem something like that
> never happened -- and the maintainers of the higher level subsystem can
> not have their eyes everywhere, so they do not notice such problems or
> are more lax and friendly.

This got me thinking: why don't we have trainings for maintainers,
instead of expecting people to decypher a combination of unwritten
rules, and written documentation containing conflicting and partly
outdated information ? Of course, the whole path going from a first
submission to the kernel to maintaining a subsystem is some sort of
training (even if it looks like the kind of epic training the hero
ninja/warrior/sorcerer will undergo on their perilous journey to saving
the kingdom more than a process designed to optimize the end result),
but at best that provides partial knowledge of the expected maintenance
process, without even mentioning the issue of keeping the knowledge up
to date. It sometimes feels we're discussing how to improve the process
without even considering that many people are not even aware there is a
process.

> If I notice a regression is not handled well in a sub-subsystem I point
> it out (often in private) to the higher level maintainers. But that does
> it tedious, does not scale, and delays things. That's one of the reasons
> why written guidelines IMHO would be worth it.
> 
> Ciao, Thorsten
> 
> [1] see the quotes from Linus at the end of
> Documentation/process/handling-regressions.rst /
> https://docs.kernel.org/process/handling-regressions.html

-- 
Regards,

Laurent Pinchart

