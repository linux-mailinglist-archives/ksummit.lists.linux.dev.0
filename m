Return-Path: <ksummit+bounces-2078-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38922B1BBD4
	for <lists@lfdr.de>; Tue,  5 Aug 2025 23:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A8DA18544C
	for <lists@lfdr.de>; Tue,  5 Aug 2025 21:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9892561B6;
	Tue,  5 Aug 2025 21:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+jQvFhu"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948662F2E
	for <ksummit@lists.linux.dev>; Tue,  5 Aug 2025 21:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754430001; cv=none; b=UFNLd2Mqi0YGpWAZYxwcZJRxh7EAscumALDpXrG9tGxgDyZju74/hRdD8uWUscEXRp8hB5g5hLmSJsV2IPK68LMdupr/TnCU7gytzrIrGLY0YdQyLtT9N1xCkTtGQvBdRheIN6C8hp86mB3I54DRSFf6GojLdKibOm14vn2qfOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754430001; c=relaxed/simple;
	bh=4QAHX0MI4rI777rVbUvMoLlv5fIszAL5jtH2hbOR2kI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Kgvzq537aYoGUpDc/sC+zPfiF1tfSkxKameQLJRQYbAm6V1xjK+idsGx+iAcJRUdbUbikspr5JFZ4+U+VHyt58lGIIJLMTamaqSm/E6PBj+aJRB6N2/AXFuNKGpR7BsoqgGQBnjvxE2adZYkEd58C00lv9EscxGfBPxkcZu+Gus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+jQvFhu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE810C4CEF0;
	Tue,  5 Aug 2025 21:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754430001;
	bh=4QAHX0MI4rI777rVbUvMoLlv5fIszAL5jtH2hbOR2kI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g+jQvFhuW5N5WjDCoekTRNAtmPll7FclRG8oMAfIaQ1g4c9KwwARu1QjlF8Keeruq
	 5fjjFK6xAnZxe4kIKFhg69pxzWs9V+ULOxfx661brLI8am9Pb1bjxU5XrdIu4hF6qX
	 DDkA5VaLDXrNhT1YQumOg8yhsIZwMUI3+kgzAig+t2vqpfNkOF6A9H+QreBQuVgo2l
	 RGHNN5x3LIGN+neC3d13S9hLv4TlaVj+HYvZWqHBOXwo1Uxq7S2uOWhRBhGEZxuFhK
	 vXwxXWEQ1SziMbZ7fhad5bZ16kNmF879VsLrqqBJAea9EigUUkGW5TMkeV69VZrNcB
	 YuUKd14GHvmYg==
Date: Tue, 5 Aug 2025 23:39:58 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
In-Reply-To: <2025080515-grandpa-prankster-ee83@gregkh>
Message-ID: <p1886464-9p9n-4p0r-52r7-70sqprsoo32q@xreary.bet>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz> <cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com> <2025080515-grandpa-prankster-ee83@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Aug 2025, Greg KH wrote:

> > > This proposal is coming as a followup to the brief IRC discussion
> > > that happened a few months back.
> > > 
> > > The amount of e-mails that are coming (with maintainers directly
> > > CCed) as a result of patches being merged to -stable is so
> > > overwhelming that I am not sure that people are making any productive
> > > use of it whatsoever.
> > > 
> > > I am personally pretty much ignoring most of it, as (a) I wouldn't
> > > have time to do anything else otherwise (b) I don't have a sufficient
> > > motivation / time to invest effort into stable in the fist place.
> > > 
> > > I feel it'd be beneficial to discuss this, and (depending on the
> > > outcome)perhaps make it opt-in (or opt-out) at least, with
> > > people/subsystems  having means how to be excluded from all that ...
> > > ?
> > 
> > Actually, if stable emails just had a header tag, it would be easy for
> > procmail to sort them out ... which is what I've been asking for for
> > years.  X-Stable-Base: and X-Stable: seem to be reasonably common and
> > catch most of it, but codifying the use in the kernel documentation and
> > using them consistently would really help.
> 
> These "a patch has been added to the stable queue" has had the following
> X- tags on them since August 2023:
> 
> 	X-stable: commit
> 	X-Patchwork-Hint: ignore
> 
> and I'm sure I only added that because you, or someone else, asked :)
> 
> You can also filter on stable-commits@vger.kernel.org, which is what I
> do locally.
> 
> So filter away!

The question is whether it's really worth all the e-mail traffic this is 
generating, if people are just filtering those away.

For context searches if some particular information regarding stable 
patch history is needed, we can still do lore/lei queries nicely and 
easily.
Is there any other usecase (that people are actually actively using) for 
it?

Thanks,

-- 
Jiri Kosina
SUSE Labs


