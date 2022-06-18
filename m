Return-Path: <ksummit+bounces-656-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 281465506B4
	for <lists@lfdr.de>; Sat, 18 Jun 2022 22:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B065A280AB7
	for <lists@lfdr.de>; Sat, 18 Jun 2022 20:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B0D33FB;
	Sat, 18 Jun 2022 20:42:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248D97B
	for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 20:42:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9148B383;
	Sat, 18 Jun 2022 22:42:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1655584941;
	bh=JGkKIPnRKhd3N6wL+AxZJ3uxC8GA8Yf/GNZANT9NDjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdGLA+IqcpuN8W/tAZjkw7dHpcJo7pKbzI6cd5u43/zAbVXLxy1Xydmjfx4wWzGCD
	 q/KHuYDM1jJGOy45dyPXs1yK1f6FX9AssU3B0THiCUfYEPlh36H+UKalG301Q97QMT
	 n+9C1TGZ9Oxkbq3YU97FwgacljwlIrDftEI4bMjc=
Date: Sat, 18 Jun 2022 23:42:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust
Message-ID: <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>

Hi Miguel,

On Sat, Jun 18, 2022 at 10:33:01PM +0200, Miguel Ojeda wrote:
> The effort to add Rust support to the kernel is ongoing. There has
> been progress in different areas during the last year, and there are
> several topics that could benefit from discussion:
> 
>   - Dividing the `kernel` crate into pieces, dependency management
> between internal crates, writing crates in the rest of the kernel
> tree, etc.
> 
>   - Whether to allow dependencies on external crates and vendoring of
> useful third-party crates.
> 
>   - Toolchain requirements in the future and status of Rust unstable features.
> 
>   - The future of GCC builds: upcoming compilers, their status and
> ETAs, adding the kernel as a testing case for them...
> 
>   - Steps needed for further integration in the different kernel CIs,
> running tests, etc.
> 
>   - Documentation setup on kernel.org and integration between
> Sphinx/kernel-doc and rustdoc (this can be part of the documentation
> tech topic submitted earlier by Jon).
> 
>   - Discussion with prospective maintainers that want to use Rust for
> their subsystem.

All previous topics but this one are technical. To restore the balance a
bit (and also because I believe it's important to the success of this
project :-)), I'd like to also discuss the impact on the kernel
maintenance at large, beyond just the maintainers who opt in to be early
adopters of rust in their subsystem.

-- 
Regards,

Laurent Pinchart

