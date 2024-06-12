Return-Path: <ksummit+bounces-1229-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A70905B28
	for <lists@lfdr.de>; Wed, 12 Jun 2024 20:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BA97289F70
	for <lists@lfdr.de>; Wed, 12 Jun 2024 18:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7590A5FBB7;
	Wed, 12 Jun 2024 18:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMKwYbEo"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23485FB9B
	for <ksummit@lists.linux.dev>; Wed, 12 Jun 2024 18:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217438; cv=none; b=AYgUnGxKbJ3aqXYEpWMsukdrrRBn2YN12asYDr12AhktQtm5C3IAAA62d5QgWh08nqD9IiQw2GxlpfcS790G2cAc8GCO8Zhtw0MJZGJAduz6XcXtaSdrgE+2G8IVLQubs2WvJXOxO1WFgzSXrDUNGNDxvawI0JqvKf3j/4LqD7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217438; c=relaxed/simple;
	bh=C+Fu9hUhY297cO9mg+pkHe/yvzfreZAL9OvQsQnBTKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpwCRWgjqTFw4C43lI36unX9WQ2c1BpsX3mdLW2soxbZHCTCn8sK9zCMCAgcqkLzIA8Y2c68QYJQyxOu7Mclv0/NTAsZfXSK3wmODqCu/wRFiz6pwfz8rHP2t115jqAtmGIXlN50m4XkdfrX9GCr7+M3hb4+nRjY1fOO/qSDC8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMKwYbEo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A9AC116B1;
	Wed, 12 Jun 2024 18:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718217437;
	bh=C+Fu9hUhY297cO9mg+pkHe/yvzfreZAL9OvQsQnBTKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMKwYbEo5zNJVBqlp6r+uGTTD8U+gsHzzGQuxO7UUkiSSuQZJp4a6TGdanj6X9Myi
	 M8GaQGxJjp8um7+dlFhDNGb9XHEDgeQOOElSOXnha5vghkeHTBB5vZ7JlD6qKF27nQ
	 vAmfaiwsnxkeS9TW7dq1+Z4BUbf4QR1wgu3bHi2jGOesaaiVZ5i0gFc6uWFPrVzhu/
	 Hg+wEXPLykmB9+sMb+d1+Oe8CJBkqJidLpgvxGqAkc/WW2oEUu/8mlsvlW4hgi0OnR
	 1Q0Q7zQ/r624v3CI9UVhdWUrzb2fqiW7Y6RfccbBdNKGUTkLvroBBuTtgY1T9z/i1t
	 RorlvSTySimNA==
Date: Wed, 12 Jun 2024 21:37:12 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [TECH TOPIC] regressions: our workflows are the biggest enemy
Message-ID: <20240612183712.GF4966@unreal>
References: <5182e50a-3d13-4edc-8f2a-a024e0588177@leemhuis.info>
 <20240612112622.21bf7c89@rorschach.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612112622.21bf7c89@rorschach.local.home>

On Wed, Jun 12, 2024 at 11:26:22AM -0400, Steven Rostedt wrote:
> On Wed, 12 Jun 2024 08:34:42 +0200
> Thorsten Leemhuis <linux@leemhuis.info> wrote:
> 
> > The talk among others will describe why some workflow patterns are what
> > frequently leads to regressions -- and why they are also a factor why
> > some subsystems fix regression quickly, while others take weeks or
> > months to resolve.
> 
> The above looks more than a TECH TOPIC. If you have real numbers that
> point out workflows that are an issue, I think this should be discussed
> at Maintainers Summit, and perhaps we should start "encouraging" people
> to change their workflows. 

This topic is very interesting to whole Linux kernel community, and I think
it should be presented in the main track and not limited to Maintainers Summit.
Especially if you want "to encourage people to change their workflows".

Thanks

