Return-Path: <ksummit+bounces-1276-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0705D908DE1
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 845EDB23FD7
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDD9175BF;
	Fri, 14 Jun 2024 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oT0yHcY5"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A493BEAFA
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718376715; cv=none; b=rLj3wv6z40M4u6kBTwHoBoV7N0p11dBJFKJChYmmQsdrqGhnKf/hsxNJPPDIX6KLCtzpbYr8+I5gZEgXJmCfLKCsweuU9eOCMrWOwo9aH8jEhczQ6dL9iTEcbpl5qT3OkEMlIel898pEnD3gEGEX5PmBNytgqnyDrSno7qb8bd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718376715; c=relaxed/simple;
	bh=m3eJ1+HKSptZ/7KcNFin8PMQPNIkzxjLWoB3JNaNdMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvMNGj78FcvgMFV55HGjZidaFT5l4MjwIkTENJTfnlADtub7jp/+pwlER/2ZDOUcDlJdKKELhPxdO4OJ0dKsIAtGVyzBXnJwIyF+f1/y/YBcwO/47t47lrc4bhKnnNQg0QAbuGonfY+p3gFQ9AHXZLedVLdYJ7bLyXbFrUFzfiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oT0yHcY5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19CCC3277B;
	Fri, 14 Jun 2024 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718376715;
	bh=m3eJ1+HKSptZ/7KcNFin8PMQPNIkzxjLWoB3JNaNdMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oT0yHcY5eGlxsLhknj2frxv+tGgqB2BwFqxENr3hchxAUnWvWvO1ynEzoimDyyyNC
	 gAZLplymBqGSbcCOeBkDUzdKEbxmvedL31wFk5Mob3aDVaCTbbeNwWg4CuyX3s0YLx
	 ActnNNro29DQUCUTZutk7EKhba0IKNt1gLz+XkHI=
Date: Fri, 14 Jun 2024 10:51:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Jan Kara <jack@suse.cz>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240614-piquant-chachalaca-of-chivalry-a5db6d@meerkat>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <ZmxXBi1-QeN5ivAe@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZmxXBi1-QeN5ivAe@finisterre.sirena.org.uk>

On Fri, Jun 14, 2024 at 03:43:18PM GMT, Mark Brown wrote:
> > Message-Id: sucks, I want a link I can open with a single click.
> 
> > At your suggestion I switched to using https://msgid.link/ as the target
> > for patch links, eg:
> 
> >   Link: https://msgid.link/20240529123029.146953-2-mpe@ellerman.id.au
> 
> > Which gives the reader a hint that the link is just to the submission.
> 
> > I don't really care if the tag is "Link:", but it has to be a URL, not
> > just a bare message-id that I have to cut and paste like it's the stone
> > age.
> 
> Actually now that you mention it some terminals (GNOME I think?) have a
> feature where they'll identify strings with an @ in them as e-mail
> addresses and if you click on one they'll try to fire up some GUI mail
> client with a new e-mail addressed to that.  This interacts poorly with
> using message IDs a lot.

Yeah, but same would happen if you accidentally click on anyone's email
address in the trailers, so I'm not sure how this has any different impact?

-K

