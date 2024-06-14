Return-Path: <ksummit+bounces-1270-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21C908D95
	for <lists@lfdr.de>; Fri, 14 Jun 2024 16:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E04F1C223A1
	for <lists@lfdr.de>; Fri, 14 Jun 2024 14:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07172DF78;
	Fri, 14 Jun 2024 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYI7OJ9w"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A9B27471
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718375819; cv=none; b=kQoQzEWPJCIAjiTKms1y8iCt+2T0RIyPZaBb33Gd6hM67xQNQ5J+rjld/OmYQhBwzcJ6g+ol/YMTFohj7wWgBi+K6WveMd2uoM7rdgRgLKG2RY4ZPnns79t2rOUhgQcD1D1/yZQ/M8wX+UYtceUcfMLEdTTFqmQwOg3Hp7NCSkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718375819; c=relaxed/simple;
	bh=l9LipkwlMJEtpFcwtueFGd+bih2JZ+fN0kt35NmaCFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9Cd/CkRsGZI57EEvovgnlMBNGPZWBi9+IdiYXXxhPwUP++Y9slxh41iLApcJ0uuH0gVNjSU5ONL4uJE1gXxW1CRpYdgKjOTRsChNQb/hjBx0agbUXRhW0RsEaX6Gm5ni5chzzIrCh/iL41RjZ8DLWGoPD4+1cVNDaPevqg7C2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYI7OJ9w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD13DC2BD10;
	Fri, 14 Jun 2024 14:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718375819;
	bh=l9LipkwlMJEtpFcwtueFGd+bih2JZ+fN0kt35NmaCFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EYI7OJ9wnr4iBzARx/aM66euOPUDQm8kLXqPIrWawJDsiTQwtNPSwesCqtnWNbiGL
	 I5iuIIV0gqsUY05xh1HdXxcim8I/WdPi1jEI/cMSO5Y3xB8jL1tHlk/CY4oOnshn39
	 +kBKlntuHr5d+LuDnOXFYotuU3+Yjh0iN8Iduvaxw690ZDs3/Yv4fyN8ugP2e8ZuW6
	 juDmv2Aazadj2B9jN5rAipjbbJQIC8ccz0NmDeEWAo2Z/3VKOr+uq3qdqgwTp/sfE1
	 izcBHfDhSiuuDNgmPY0JSOdW4zIt1DFMiIxXqOQ4f0bMv1G/vJ8XXD5YxfBEVXIA8y
	 8JXmZz+PyH9KQ==
Date: Fri, 14 Jun 2024 15:36:46 +0100
From: Lee Jones <lee@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240614143646.GI3029315@google.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <20240614091949.GB3029315@google.com>
 <20240614-quirky-watchful-fulmar-a9bc50@lemur>
 <20240614-offbeat-talented-warthog-9c3de7@lemur>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614-offbeat-talented-warthog-9c3de7@lemur>

On Fri, 14 Jun 2024, Konstantin Ryabitsev wrote:

> On Fri, Jun 14, 2024 at 08:27:30AM GMT, Konstantin Ryabitsev wrote:
> > On Fri, Jun 14, 2024 at 10:19:49AM GMT, Lee Jones wrote:
> > > > 1. disambiguates Link: trailers so they point to relevant online discussions
> > > > 2. allows tooling like b4, patchwork, etc, to reliably match commits to
> > > >    submissions for the purposes of better code review automation
> > > > 3. allows stable and similar projects to better track series grouping for
> > > >    commits
> > > 
> > > Sounds good to me.
> > > 
> > > So `b4 am -l` should be replaced with `b4 am ?`.
> > 
> > You can still use -l for this by adding this to .gitconfig:
> > 
> >     [b4]
> >         linktrailermask = Message-Id: <%s>
> 
> I also just added the -i flag, which will make it into b4-0.14, so you'll be
> able to run "b4 am -i" to insert the Message-ID: trailer instead of the Link:
> trailer.

I might keep both.  It'll give Michael something to click on.

-- 
Lee Jones [李琼斯]

