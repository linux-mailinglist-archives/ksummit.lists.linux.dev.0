Return-Path: <ksummit+bounces-657-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4E35506B7
	for <lists@lfdr.de>; Sat, 18 Jun 2022 22:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 764FC2E0A2C
	for <lists@lfdr.de>; Sat, 18 Jun 2022 20:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192D433FB;
	Sat, 18 Jun 2022 20:44:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A017B
	for <ksummit@lists.linux.dev>; Sat, 18 Jun 2022 20:44:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AA8C7383;
	Sat, 18 Jun 2022 22:44:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1655585057;
	bh=K4u8WFor8vX7uohoYj54m59JD2L0GY80nCd8/aH0raA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NacexL0xdyCInKa2+JWKOYxig7D/YWC6TSSgY936rsTFafzAUPgbZejuNTmBJJoie
	 Phz1w6aW02cjVUu3bCkpZoknEl6RMJD7A8x4+sAYUmsTmSbdW7IUc5SyfJLtXOPqeg
	 QQPENjN2pP3pqEuY5xzIvu/MhIvHFuoBPqQ1N2m4=
Date: Sat, 18 Jun 2022 23:44:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust
Message-ID: <Yq45E0yUEypGPhzi@pendragon.ideasonboard.com>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>

On Sat, Jun 18, 2022 at 11:42:09PM +0300, Laurent Pinchart wrote:
> Hi Miguel,
> 
> On Sat, Jun 18, 2022 at 10:33:01PM +0200, Miguel Ojeda wrote:
> > The effort to add Rust support to the kernel is ongoing. There has
> > been progress in different areas during the last year, and there are
> > several topics that could benefit from discussion:
> > 
> >   - Dividing the `kernel` crate into pieces, dependency management
> > between internal crates, writing crates in the rest of the kernel
> > tree, etc.
> > 
> >   - Whether to allow dependencies on external crates and vendoring of
> > useful third-party crates.
> > 
> >   - Toolchain requirements in the future and status of Rust unstable features.
> > 
> >   - The future of GCC builds: upcoming compilers, their status and
> > ETAs, adding the kernel as a testing case for them...
> > 
> >   - Steps needed for further integration in the different kernel CIs,
> > running tests, etc.
> > 
> >   - Documentation setup on kernel.org and integration between
> > Sphinx/kernel-doc and rustdoc (this can be part of the documentation
> > tech topic submitted earlier by Jon).
> > 
> >   - Discussion with prospective maintainers that want to use Rust for
> > their subsystem.
> 
> All previous topics but this one are technical. To restore the balance a
> bit (and also because I believe it's important to the success of this
> project :-)), I'd like to also discuss the impact on the kernel
> maintenance at large, beyond just the maintainers who opt in to be early
> adopters of rust in their subsystem.

This may be better addressed as part of the maintainers summit (I've
just seen your proposal for that event), but I'm concerned that the
audience there will be very restricted due to the size of the event.

-- 
Regards,

Laurent Pinchart

