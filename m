Return-Path: <ksummit+bounces-2086-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC575B1C014
	for <lists@lfdr.de>; Wed,  6 Aug 2025 07:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06BAE183E3D
	for <lists@lfdr.de>; Wed,  6 Aug 2025 05:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DC420297B;
	Wed,  6 Aug 2025 05:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="HLPW2i5a"
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E29D2E36ED
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 05:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754459376; cv=none; b=CTDhzJSsn8oXHY8S0S9BoicWVtDasHNiP3i/KHa2GU+1ZRqx9w1U+2/p9dBAVZSrzHTLxtmgr5FiWcMvaF5AfxcIgSXor/gvsd0GUV38tBY588Qjs6uSIPWZZZVbDTfs/91FBl8fWwjng1YlKcy+jCz5vO5r/qVcFrJ3/en1UNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754459376; c=relaxed/simple;
	bh=9VGr0t5cN1OHxGzAJOjhT81JbHXMlMRJfDeseHG8yz0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OdU7uNfyvy4JpOgz1AwGBezYcNkCfKcfs23a14MNkYefmSkvi+TqecTt+65K1S2PdZ5ZS1mZztsa8hkwXVJM3YwMFU1c8uex7U3PUxTIA7CtFt9r6MLTipDk4yGvXDMMb0cefxpYYG5uEWHomvgYpb3wvsIjRzcTO1sHVoztSr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=HLPW2i5a; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XQd1Dw0z/PGLSLcZV8blyjGrECQ8Jb+Ug7HGdiRjjKw=;
  b=HLPW2i5anX/c/Ql0yqZ0XNzy7UTW1uB+3EvcscVjEeSy0s9zX6JdHGS1
   j0Pl8SKocGLeaPzdonzizoo4kZESh50fdTznkysjJ14STsb7KLrzS7l6U
   muzCVDIAwxnYLyKGk/LMR9853teEXAa4qb90IayfldBElH/ebuy2OKMoR
   E=;
X-CSE-ConnectionGUID: jYhVRLQyRxaYhfKtAuiGOg==
X-CSE-MsgGUID: NZcM/nyjSQu1VR4FejWFbQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.17,268,1747692000"; 
   d="scan'208";a="234301746"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 07:49:25 +0200
Date: Wed, 6 Aug 2025 07:49:24 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "H. Peter Anvin" <hpa@zytor.com>
cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
In-Reply-To: <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
Message-ID: <alpine.DEB.2.22.394.2508060747440.3518@hadrien>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local> <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 5 Aug 2025, H. Peter Anvin wrote:

> On August 5, 2025 9:03:18 AM PDT, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> >Unavoidably, LLMs are the hot topic in tech right now, and are here to
> >stay.
> >
> >This poses unique problems:
> >
> >* Never before have people been able to generate as much content that may,
> >  on a surface reading, seem valid whilst in reality being quite the
> >  opposite.
> >
> >* Equally, LLM's can introduce very subtle mistakes that humans find
> >  difficult to pick up upon - humans implicitly assume that the classes of
> >  errors they will encounter are the kinds other humans would make - AI
> >  defeats that instinct.
> >
> >* The kernel is uniquely sensitive to erroneous (especially subtly
> >  erroneous) code - even small errors can be highly consequential. We use a
> >  programming language that can almost be defined by its lack of any kind
> >  of safety, and in some subsystems patches are simply taken if no obvious
> >  problems exist, making us rather vulnerable to this.
> >
> >* On the other hand, there are use cases which are useful - test data/code
> >  generation, summarisation, smart auto-complete - so it'd perhaps be
> >  foolish to entirely dismiss AI.
> >
> >A very important non-technical point we must consider is that, the second
> >we even appear to be open to AI submission of _any_ kind, the press will
> >inevitably report on it gleefully, likely with oversimplified headlines
> >like 'Linux accepts AI patches'.
> >
> >The moment that happens, we are likely to see a significant uptick in AI
> >submissions whether we like it or not.
> >
> >I propose that we establish the broad rules as they pertain to the kernel,
> >and would like to bring the discussion to the Maintainer's Summit so we can
> >determine what those should be.
> >
> >It's important to get a sense of how maintainers feel about this - whether
> >what is proposed is opt-in or opt-out - and how we actually implement this.
> >
> >There has been discussion on-list about this (see [0]), with many
> >suggestions made including a 'traffic light' system per-subsystem, however
> >many open questions remain - the devil is in the details.
> >
> >[0]:https://lore.kernel.org/all/20250727195802.2222764-1-sashal@kernel.org/
> >
>
> It would seem to me to be far more useful  to get AI to help find hard-to-see but perhaps common problems, or tidying up code (like Coccinelle on steroids.)
>
> Things that are easy to see post hoc are correct, but can be hard or laborious to do.
>
> Another genuinely good usage for AI is for especially non-English speakers to tidy up their patch comments and other documentation.

There are also some parts of the kernel that are supposed to have
comments, such as memory barriers.  AI could help ensure that the comments
are actually meaningful, and perhaps suggest to the developer how they
could be improved (sort of a 0-day for comment quality).

julia

