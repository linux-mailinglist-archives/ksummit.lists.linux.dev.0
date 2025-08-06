Return-Path: <ksummit+bounces-2089-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D08B1C0D8
	for <lists@lfdr.de>; Wed,  6 Aug 2025 09:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DF16625228
	for <lists@lfdr.de>; Wed,  6 Aug 2025 07:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ECC218821;
	Wed,  6 Aug 2025 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLdiDOAj"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA3E217F56
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 07:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754463652; cv=none; b=iMnTmvp/h/Htv74iQvu/LhueTYpKTdEzoESH2f9AbzHackaK8ia9gntkTP08mWSF6G6bmteqhJT1THwwyHEcFBxhPRuhjtgS1kLh0hHiGNwf6kJ/ngXSKwa3F+d4AAfyGdLSW0j7SCnMJ3djTXmAtTPtkQSeraN+JkoH5qJkphY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754463652; c=relaxed/simple;
	bh=5syjNZVhz6dDOHIOX7a/lZTSrFJxcj8DLCbYn58fnXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OXI9lENNq1u8UEqfpMb6W0TZXHxUsiD/m0zVzSkXGwpTb7VSEMmOVQnzrp/2Qnx2dhhGit59XYw82p4XI3Q9FtPO9HppYy+v29sO8AWIBFbgE7swUurRK00GrMviaLFkjyvckHKEjfDLjtQ/kL616DUWYYhL59vd+FR933et+fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLdiDOAj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F609C4CEF9;
	Wed,  6 Aug 2025 07:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754463651;
	bh=5syjNZVhz6dDOHIOX7a/lZTSrFJxcj8DLCbYn58fnXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VLdiDOAj9oN4384IyILPdqbWfe+jRZpIyxYeDKMiiS7l6pek1v5xcHQjSt0nN60pS
	 SCkafGNQVnEoueaTKJ0/7mHHZnI9pcXJTdrI/s0p87pKeILG4SbYghch27ZOiOHcK1
	 KveQX83mu6vgLg7IYMJViREIyuEIdqwaI5Qthd3lG5FVxYVwAFKf/NyTy1gDYm028I
	 TqW0V0IOAo3mx3JkfTcqLkVr/mGLzIy3wJXYmcB7fSSPWGOwUx/3OZUcNuETY2F3qj
	 VJIpfM3v2GfUWWVPMdEwLn3Z4YlTJhk+kzAknBaSB4DU/JbD6uftQTQWzRLbEof29Q
	 9PkfC/CXlEkgQ==
Date: Wed, 6 Aug 2025 09:00:49 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
cc: Greg KH <gregkh@linuxfoundation.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
In-Reply-To: <87ectprmmg.wl-tiwai@suse.de>
Message-ID: <234rn3r2-qss4-s6s4-8o69-81o79rqp9s54@xreary.bet>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz> <cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com> <2025080515-grandpa-prankster-ee83@gregkh> <p1886464-9p9n-4p0r-52r7-70sqprsoo32q@xreary.bet> <87ectprmmg.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Aug 2025, Takashi Iwai wrote:

> > The question is whether it's really worth all the e-mail traffic this 
> > is generating, if people are just filtering those away.
> > 
> > For context searches if some particular information regarding stable 
> > patch history is needed, we can still do lore/lei queries nicely and 
> > easily. Is there any other usecase (that people are actually actively 
> > using) for it?
> 
> In rare cases, patches are incorrectly applied.  That can't be
> verified without the actual patch.
> 
> Usually it happens with a cherry-pick with fuzz, so we might be able
> to catch suspected ones, but the inspection of the patch is still
> needed.

Sure, but you have to do that pro-actively (in case you care in the first 
place, of course). Doesn't then lore/lei provide you with the equal 
functionality?

-- 
Jiri Kosina
SUSE Labs


