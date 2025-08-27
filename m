Return-Path: <ksummit+bounces-2231-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AC4B38597
	for <lists@lfdr.de>; Wed, 27 Aug 2025 16:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A7373ADEEC
	for <lists@lfdr.de>; Wed, 27 Aug 2025 14:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5FE24A066;
	Wed, 27 Aug 2025 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="mxUWkBeR"
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BB120DD75
	for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756306762; cv=none; b=RD1PVoPXPGy8s90GR5TPv+fvFCdJYHgWrFPdh+00GtwDrQxNyvRWbpK1ASJbQA2r7XIehGSoV2EQ2sl22jY+zmxZzD6Q7NAoFcyLm7ORJ4uU5JtEtwVqZBGfjdxUPPRtHkRksxfRV8ywexfkeYW2Q3F0wM9tAVHFAeLjymJzs7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756306762; c=relaxed/simple;
	bh=1uAmX/S/1Hdd3XEjHYasOPxylz9whgaW8jBu6tdBKxE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cmjFdI5iX7WRQ67pJvjBPabiIIEZvwzq3FT8bn1eFKCEIV7eOXl0Njf9B/fSFl6CyN6ndHuK7REme8Q4VM5ZMLw7jkAg4nyEvj/jWD+jn+lYjG12ozbxzETEn9d3TgcBocdz8K3K0x8Lfx4XeAtCaITvdDi/yQrloWoHj33C3OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=mxUWkBeR; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Rhe0/cUwoUF5mM/HKpVSvD9G1+c1MVgqUOVuvOTypXU=;
  b=mxUWkBeRjTFdy/jmuY2d21BfAFXUiAoOoF8iBhd0l/BppG8Ov9NAJXz5
   VchP4lsScmgXSdXFAvbGUY6e8ZsviFibiH2wgQFebXjNsAG6mYC1jCcQd
   1poAnBeZN4FtHcmJMqCU7n5/dSsGr7vvAElnWE6lrhPfKPcMqVczCshm3
   M=;
X-CSE-ConnectionGUID: SaYIFBkCQlmVy2oxq+uqtA==
X-CSE-MsgGUID: PbYj6dcvQJCaqw/bE0ij4w==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="124029158"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 16:58:08 +0200
Date: Wed, 27 Aug 2025 16:58:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
In-Reply-To: <CACMJSet5r0PDFsYRcNWKQH_jfimqpQWZ2nL2YKoc-+QisNNykA@mail.gmail.com>
Message-ID: <e5e72565-6421-8f1e-50d2-6deecc303faf@inria.fr>
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com> <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com> <CACMJSet5r0PDFsYRcNWKQH_jfimqpQWZ2nL2YKoc-+QisNNykA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1268481417-1756306688=:3517"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1268481417-1756306688=:3517
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 27 Aug 2025, Bartosz Golaszewski wrote:

> On Tue, 26 Aug 2025 at 22:12, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, 26 Aug 2025 at 12:58, Bartosz Golaszewski
> > <bartosz.golaszewski@linaro.org> wrote:
> > >
>
> [snip]
>
> > > 4. Make build bots detect it.
> >
> > Fine, but doesn't solve anything.
> >
>
> How so? The developer gets an email telling them they used a legacy
> API, the maintainer sees a build bot report and knows to ignore the
> patch. That's already better than what we (don't) have currently.
>
> > > I would like to propose a discussion on how to enforce API deprecation
> > > in a way that supports efforts to reduce technical debt, without being
> > > hampered by developers and maintainers who mean no harm but simply
> > > don’t know any better.
> >
> > Here's the only thing that works: if you change the API, you have to
> > fix up all existing users.
> >
> > If you are not willing to fix up all existing users, and you introduce
> > a parallel API, then you are the one that maintains both the old and
> > the new API forever.
> >
> > Or at least until somebody else did the work that you weren't willing to do.
> >
>
> That sounds great in theory but in practice, one may be willing to do
> the work and it will still take years (as is the case with GPIO) where
> there were thousands of calls to the legacy API and - due to the
> nature of the differences between the old and new one - the
> conversions are far from trivial.
>
> I'm not advocating a policy change, I'm trying to bring up the subject
> of making the effort easier for those who participate in the tree-wide
> refactoring.
>
> > End result: the burden of new / different API's is on the person
> > introducing them. IOW: don't introduce new API's unless you are
> > willing to support them.
> >
>
> I would assume, kernel developers in general and maintainers in
> particular want to make linux better. An old API may have been
> introduced long ago in times where we didn't know what we didn't know
> (or even implemented by completely different people altogether) and
> the new one, implemented later, is objectively better.
>
> Sometimes a new API is close enough to the old one, that it can simply
> be wrapped in backward compatible inline functions and the
> implementation is the same for both. That's awesome and supporting the
> legacy interface is not a big problem in this case. However, in other
> cases, the underlying change in philosophy can be so fundamental that
> we effectively end up with two intertwined implementations where a lot
> of code could simply be removed once we unify all the users. In our
> case, the work IS happening and several people are contributing. My
> point is: this effort is commendable and should be supported rather
> than brushed off with a "that's the API's author problem". I'm sure I
> don't have to even name the advantages of having less code to
> maintain.
>
> And to address your last sentence on a personal note: thing's arent
> always so black and white - for me: I inherited the GPIO subsystem
> with both the old and the new API already present tree-wide and am
> just trying to improve the pre-existing situation.

Is there some centralized place listing what APis need attention and
giving some hints about what should be done?  Hints could be text or
change examples or pointers to commits where the change has been done.

julia
--8323329-1268481417-1756306688=:3517--

