Return-Path: <ksummit+bounces-2193-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98616B30842
	for <lists@lfdr.de>; Thu, 21 Aug 2025 23:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50D80188B3D9
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC672D7DCA;
	Thu, 21 Aug 2025 21:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T63Ria4i"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5B52C0298
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 21:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755811097; cv=none; b=O1ynS8USPusLVsRp4z2M43fe44QIh9Sg+YURqpmC3SLwiIqx+4TLZFr2GHJ/WAkS1IsuwI2rgeth65Q+J75uKJH7Qbe0sT3Mk49djw2ydIMOcBt/CKegeEBKA/xRGO2PZ4s9Mly3CTIqREVKYeA5yScFzZp7g++sJ+4wAXFOSec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755811097; c=relaxed/simple;
	bh=I1+FBUWGfJE2eGpB2FW589wtohWKGnYzQntqihoe88I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QvTOeom1ZM/YdGAelufXewYrJCHPbgxjH443h8sgENij0GsKyVDQf2X9bI+ul0w4p834pQ5wmsSpkqAF22DCwy2/w5OXB5j3yDdFOt5MIOL7Vj7g+ekfk98DGx2VlS2jAhiTequ7JoR9N9uBUkUbeVY1pihVm7IWJZh55LeNj3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T63Ria4i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5806DC4CEEB;
	Thu, 21 Aug 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755811096;
	bh=I1+FBUWGfJE2eGpB2FW589wtohWKGnYzQntqihoe88I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T63Ria4ih9BEVOI4/6/VoBE/5AlGYhjsnb6AhzSrD4YkMLTBp4JC1Sd/JP/xWxaO+
	 50Lb9qTXmdlCmRxlxb6eRDMFSbrYfJby4umqifDfjzKGw9GqJCbIRy1EEkC/w+GXEY
	 HGEFcSATmsr8i2afvE5cLHrrOcHbo/I16FHhl7iVcXc45dEMdFgLJtr+6Y28L7eszE
	 0WIurTLJmV7cdXhEblm0fmN9L2WSBoD4Frg/BMeBDE02kjVTSjbj2Yt/dirresuHaR
	 ndWmyRcHTEc4EgTi6n7nZpkvzAbB7yqF9Q5wXqGY24FjLFLRJlfCG+OlmIGNfxSXRM
	 B4a3i5LB5Rm4A==
Date: Thu, 21 Aug 2025 23:18:14 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
cc: "Paul E. McKenney" <paulmck@kernel.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
In-Reply-To: <o8r437r9-30sr-o187-8599-qss9p3p7303o@xreary.bet>
Message-ID: <913nn653-9797-0s7s-p8p8-n91so300ppq0@xreary.bet>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz> <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org> <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop> <20250818230729.106a8c48@foz.lan> <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com> <4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl> <d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
 <20250821122329.03c77178@foz.lan> <o8r437r9-30sr-o187-8599-qss9p3p7303o@xreary.bet>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Aug 2025, Jiri Kosina wrote:

> And one of the points why I originally brought this up is that I believe 
> we need either (a) be able to take the informed decision/risk by applying 
> a patch we know has been written by AI, or (b) be able to outright reject 
> it on that basis (e.g. if it's too complicated).

... and again, that's leaving all the legal aspects (which need to be 
figured out as well, of course) aside.

-- 
Jiri Kosina
SUSE Labs


