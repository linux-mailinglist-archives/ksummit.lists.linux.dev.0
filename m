Return-Path: <ksummit+bounces-2365-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B61FDB53C77
	for <lists@lfdr.de>; Thu, 11 Sep 2025 21:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61BF71742A8
	for <lists@lfdr.de>; Thu, 11 Sep 2025 19:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABA025C6EE;
	Thu, 11 Sep 2025 19:42:43 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F62DC765
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 19:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757619762; cv=none; b=nkT6H7Y5OkoD7KgneTR9hzyPEtq7x+5zmenZFkuW2mBZeYAWOHQaveVvA3tAoQejrx1zmKNCG1MQGnt+MHs25zAG/cNL+8DsjaXvr3sk+KWYSo0efEx+2JKpbeWSA4FHYtoa8Ymp8dXMrGb9M88fhWx2poAGYCigYnRUIxPI37U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757619762; c=relaxed/simple;
	bh=UswXRapy8t8iG/B5xBi+Rk/9BtANlmJ1/ym4lVKZhdw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGcgp2IvXqziYA540gubW8h/Baq832G1a2lJSyB0z4CW9+WjP0kuE/g1kenhhGolKUD3CMdmvj3NhFVk1UQ6c26LkqnG9+twL2pSlkpVG1lcoBddkaGYV4aVcRTUDXGkVf8h/Mm8EzTwRL3VFgNxyTmKS0LJ4XuvXwEjpSiIcD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 5EADF1A0585;
	Thu, 11 Sep 2025 19:42:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id A470F29;
	Thu, 11 Sep 2025 19:42:36 +0000 (UTC)
Date: Thu, 11 Sep 2025 15:43:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <20250911154329.41757f50@gandalf.local.home>
In-Reply-To: <20250911192914.GG13915@pendragon.ideasonboard.com>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
	<20250911122711.GC8177@pendragon.ideasonboard.com>
	<e7a60ee9-77fe-4729-a58d-441543792de7@sirena.org.uk>
	<20250911102506.43ee7f9c@gandalf.local.home>
	<20250911192914.GG13915@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: rucya8exzjfra5x7we317jdcj3hchz3y
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: A470F29
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19OEJExdHZLSewektdPx6dtboOZIMcMNf8=
X-HE-Tag: 1757619756-199455
X-HE-Meta: U2FsdGVkX1/DJcoKo3YsBnI+tynBED69iPz14XNRSmB9XyUfAFWWmqpydvUvv6DYjkbRDXhGbwr6UO9k6WLqS+ivVvBgmrI7+4hs+sjosBuuT+wIg/9+++JDMfXD40Zo6TWwwnaJ9ydGVsOg9w3h26kFScXW4iOqtMDNsZQRRG9auMyip6Z1emksE+aH7IXYkif/4/0b65CyiZ6Cne6WOGPFGbHT5cxf8yQguhQkHkHaJKthpqzZ62l2f3gBXq7R07ln7yEpz9PaEpHEMoKoFM5BFLKbeipu5GRvgCl8jm2H1yLU67C/sajbrwG1aRGtRJGba1fRpwSEelyuhvaJxKBCWhSKOn7861Ct1oVwmkgIelzNlC2hVxVjEHxDAsyb

On Thu, 11 Sep 2025 22:29:14 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > I now have several topic branches, and I try hard to avoid merges as they
> > tend to make my pull requests more complex. But every so often, I have a
> > patch that comes in that is required for work in two of my existing topic
> > branches. This is a case where one change is required for two topic
> > branches to continue more work.  
> 
> Do you then send an individual pull request for each topic branch to
> Linus ?

Yes I do. Linus suggested it. I use to keep everything in a single branch,
but when Linus had an issue with one aspect of the pull request, it caused
me to rebase the entire thing. That's when Linus said I needed to break up
my changes into different topics so that if he had an issue with one, it
wouldn't stop the rest from getting in unmodified.

> 
> What if one of those topic branches had to aggregate patches from, let's
> say, 10 different series from 10 contributors who each sent you a pull
> request ? Would you merge them or cherry-pick them ?

Currently, the only pull requests I take are separate topic branches where
the merge usually ends up being a simple fast forward. Most of my updates
come from patches that I just pull into my topic branches directly from
patchwork.

I likely don't have the complexity of DRM.

But looking more at the tip tree, which is much more complex than my own,
which also has several topic branches. They merge in branches from others
via pull requests, just like Linus would from us. They don't cherry-pick
nor rebase, unless its patches from the mailing list. I believe Linus is OK
with that workflow.

-- Steve


