Return-Path: <ksummit+bounces-2657-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D04D5CAC06E
	for <lists@lfdr.de>; Mon, 08 Dec 2025 05:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 351D730181B6
	for <lists@lfdr.de>; Mon,  8 Dec 2025 04:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6A423C505;
	Mon,  8 Dec 2025 04:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="DQURwknM"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D333B8D53
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 04:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765168288; cv=none; b=pqRXOLnXfPuuMzmmIfRlLYr+Gn751rj3xRgwyKh0fj/CbyvtOL3d+4fOoxTgqZptQtUcebPR8tX+zrZSUwZnypPtf4mgCMUGjCDjT1Ub+46bWn3uaDwAFbblTq5Nf0qs6qQig+SATDPEfN5/k4uWSQG3JlTlmeyf3VIOaYPblgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765168288; c=relaxed/simple;
	bh=1N6BBu2mpgVoqv1z0P+zp2AZJW2LJ7ycggn3hqeb8l8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oMXD2rU2ohlhcSyqw/KyN8+w8ZA9ABfkFoxYcvXcQlvs3cYurG7P392IBkwRfpwMQz8po4eWHVv3ynEFR/iOlcdEMcEc2Qwjs9lp+ELkvg2wjQkNyFGMjZi5uvtxIbVJxruGyFvNke+NwRIRbt9ra8nv4AfmU1Y7Ov37NpnOkFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=DQURwknM; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 13B364040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1765168285; bh=urgYz/ejMQitc5NNMW5MHPmUtL/VVdcecmsTnc0fw3U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DQURwknMiu6mDoqwdEYM/SCkTrDEnK5IKpyd2aEJ5d9QbwyEtDNqyJY7hQAeS4OQU
	 9ixgspMSRAzAmsyYq3JWsQwSyJMIx09FBsD04nFknlJX4EwhsB1G85+KFZOapBE0Xl
	 XKeJGIMIb2jDhnPdiPVRwLP1hRrrXGW6kWDoeWxZ32RKkWr5XDpU7VSgH5z9pXzQDP
	 ymgTnogsq4t+OLlRGBXtjrfn/V+HuMq8OX9UX7Vb6ngi2CeOUh9MV6Cj0GQNG+gqzZ
	 2Cu9JSY04Gsq/lL8pymdH2VHV8hYk07PW0iv1zIUSXx9AWZdwve4JcfXw4VM6jJuWg
	 GDFq8jgWEnplg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 13B364040B;
	Mon,  8 Dec 2025 04:31:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sasha Levin
 <sashal@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel process
In-Reply-To: <20251208041507.GB30348@pendragon.ideasonboard.com>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <aTYmE53i3FJ_lJH2@laps>
 <20251208041507.GB30348@pendragon.ideasonboard.com>
Date: Sun, 07 Dec 2025 21:31:22 -0700
Message-ID: <87qzt5fvc5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> This is a pretty good summary. It's missing one point in my opinion,
> partly related to the legal stance: the ethical stance.
>
> The Linux kernel is governed by the GPL. There are contributors who care
> about the copyleft aspect of the license. Even if the legal issues get
> cleared in the future, not everybody will agree that usage of GPL code
> as input to create proprietary LLMs is ethical:

Somebody needs to say this: that is an important ethical question, but
it is far from the only one:

- The creation of these LLM systems imposes significant costs on anybody
  trying to run any sort of open resource on the Internet.  I have
  ranted at length about this... Konstantin has been rather more
  restrained, but the effects of this industry on kernel.org have been
  significant and expensive.  Using these systems makes us a part of the
  problem.

- Before generating code in this way, we should think about the
  jet-engine turbines now powering data centers.  We work on Linux to
  create a better world; wrecking its climate is not conducive to that
  goal.

- The BitKeeper experience showed us what can happen when we make our
  processes dependent on proprietary software.  We should not forget
  that lesson regardless of how shiny the new toys look.

I'll stop now :)

jon

