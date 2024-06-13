Return-Path: <ksummit+bounces-1242-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4148B906B10
	for <lists@lfdr.de>; Thu, 13 Jun 2024 13:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56B681C21B68
	for <lists@lfdr.de>; Thu, 13 Jun 2024 11:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7971014265E;
	Thu, 13 Jun 2024 11:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uLZiMqaq"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB8213791B
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 11:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718278520; cv=none; b=PmW1gwOmsH0l6EO8lOCB4mNNZ6FH0JZqwdQTekKe4dj6l1XTx77VcvKDQhgUJboQBjnycFAxVQuLMJEpUoN8wwChyHC3qEJYdkTUqVXni9pfUS+ZMuL28cun9Rc3jb8yj0qL8vU+PV69TkagEkA/rNb7A2Um/Q9dUb/XB563f94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718278520; c=relaxed/simple;
	bh=/wmzoa4N1DB7+Zm2dcBYcGq92pAboh8QZwBcXy9oeLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxfquIr+TQ0yl/4FxU76D0b5SPJhCcdLKnd0lk9w9PD78YEfXPUa9kbIK2dE//7SSR56MuTkrqLlgjb/QF+Y3YoPbHQjDg5JPettD3w79uentJdXkL7g1cRy32ai7qWgTk+J/HgFHlTvUe/jV5IgWqj6e8jzhXTdJFt1Q3rxtVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uLZiMqaq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B168C7E0;
	Thu, 13 Jun 2024 13:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718278502;
	bh=/wmzoa4N1DB7+Zm2dcBYcGq92pAboh8QZwBcXy9oeLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLZiMqaqZsjHQ0EABa2dO7hwF908RXy3jjGcOZ/GMh7vwvePQ/h2XIBTEf5cE3cHZ
	 DPAO/+r3xWk/HsfKz3GS7W+h5Z12jBXBtc2sRLVo7gtM0D8wbs2RVx/PGAE2ckVNsd
	 NHMjVSeqAQPSFqw17m5GaWDIzSThwXfFxSanUv+o=
Date: Thu, 13 Jun 2024 14:34:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [3/4] Elevate handling of regressions that
 made it to releases deemed for end users
Message-ID: <20240613113455.GH6019@pendragon.ideasonboard.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <55e89d2c-fa25-4daa-805e-5aca31b321bf@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <55e89d2c-fa25-4daa-805e-5aca31b321bf@leemhuis.info>

Hi Thorsten,

On Thu, Jun 13, 2024 at 10:34:17AM +0200, Thorsten Leemhuis wrote:
> I propose we elevate fixing of mainline regressions that made it to
> releases deemed for end users by setting a target to ideally mainline a
> fix (which might be a revert) within two weeks after the culprit was found.
> 
> That IMHO would lessen one of the big pain points for users regarding
> regressions, as quite a few make it into proper release and then take
> quite a while to resolve (as shown in the scenario in the mail at the
> start of this thread). So much so that quite a few users afaics doubt
> that we take our "no regression" rule seriously.
> 
> This is why I'd like to see such situations resolved even faster than
> regression that happen just in development kernels. "Expectations and
> best practices for fixing regressions" in
> Documentation/process/handling-regressions.rst (see [1/4] in this
> thread) kind of covers this already:
> 
> """Expedite fixing mainline regressions that recently made it into a
> proper mainline, stable, or longterm release (either directly or via
> backport). [...] Aim to mainline a fix by Sunday after the next, if the
> culprit made it into a recent mainline, stable, or longterm release
> (either directly or via backport); if the culprit became known early
> during a week and is simple to resolve, try to mainline the fix within
> the same week. [...]"""
> 
> I'd like to make the language somewhat stronger.
> 
> """Handle mainline regressions that recently made it into a proper
> mainline, stable, or longterm release (either directly or via backport)
> with an even higher priority and try to fix them as fast as possible.
> [...] Aim hard to mainline a fix by Sunday after the next, if the

Are we really telling people, some of them contributing in their spare
time, that they have to work during weekends ?

I don't think piling pressure will help. What could help is to reduce
pressure on already overloaded maintainers, to give them more time to
handle regressions. There have been multiple discussions about
co-maintainance models over the past few years, and some subsystems are
(slowly) moving forward. I would be more interested in participating in
that effort. It otherwise feels like we would just add pressure on an
already overloaded system, without caring that the system has no
reasonable way to absorb that pressure.

> culprit made it into a recent mainline, stable, or longterm release
> (either directly or via backport); try to mainline the fix within the
> same week, if the regression apparently bothers quite a few users or if
> the problem with the culprit became known on a Monday or Tuesday."""

-- 
Regards,

Laurent Pinchart

