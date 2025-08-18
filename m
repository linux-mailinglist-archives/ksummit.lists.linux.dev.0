Return-Path: <ksummit+bounces-2155-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB589B2B1DC
	for <lists@lfdr.de>; Mon, 18 Aug 2025 21:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CF9B3A6F36
	for <lists@lfdr.de>; Mon, 18 Aug 2025 19:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C20259CA7;
	Mon, 18 Aug 2025 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lg8qScmZ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D32586349
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 19:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755546427; cv=none; b=kVVZfj/yoBpkXqnXH8kxYIymJydLt6Bth4lB/u4s4BDnIu0/CsWvK74/mkOnPBgSst005N5zGDOrpbCYRtIKwX7dPs9UTqts3Pwm+skIggsTvz+Jv5CSDRkNUHI0FK24sl/94swkXneil53C8j+B/7qTDaRrKejEgQK/L2TcJp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755546427; c=relaxed/simple;
	bh=AbiPeFsWz6b/LMXZNYb1L2IdPoRI9DOkhhpVvBxmAl8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ia+ykENyOAZgHxopPF1MS06x4IIcLmDIR51goAeoTBksHwEH7mhnljwTT7xP4GXVY5caqH/Rwp4VJqUYCcbbSHJFSi/qRt0oYchULkaoFe4FGob/NAHrckjU8A70GVAohne5Xx+tUQ2TKbma5JZ/BRYYtSCavMh6yfXxCuoiXvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lg8qScmZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F32C4CEEB;
	Mon, 18 Aug 2025 19:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755546427;
	bh=AbiPeFsWz6b/LMXZNYb1L2IdPoRI9DOkhhpVvBxmAl8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lg8qScmZzsbeuWWAgCzSNsqWdrlkLax08x9uzHnBjOFTHVC8QEShJy3R73NFChabq
	 kWhmqETHm1FBcY0TN61KKvxnacQwQ21qbxX1qyVedqIZkD+i61RDR9gc8G4+Ep3fQi
	 psy/gaEtkKWb9egcyRbQZHF+aHhcCeGdUiTUWOVU8Lte/xwYNlBD+GF5O/ak2tD7BF
	 GwpmPUVgOO/MqHkwxYQuOE/1BUmfK08TXJkOquXq3+++TLDRbKgkjOilVHKUpg9HpO
	 GCvDKrpzXctbRoX3HwKAolv4QXMg/oubPJHQ07PyZqC8yz8gGL/Cy0Fnu4mx4IqAlv
	 2/pOKGThX+knQ==
Date: Mon, 18 Aug 2025 21:47:04 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    paulmck@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
    Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
In-Reply-To: <CAJZ5v0hWT8GfiPbWZvcc3dYnM9zdsX40NeUiqDYT-7VWTTTqyQ@mail.gmail.com>
Message-ID: <2216q733-8126-so9p-spr9-068r9q91qo80@xreary.bet>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz> <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org> <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <20250818211354.697cb25a@foz.lan> <6o4sp81n-q5rr-6n92-o48o-4pr34s9n426q@xreary.bet> <CAJZ5v0hWT8GfiPbWZvcc3dYnM9zdsX40NeUiqDYT-7VWTTTqyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Aug 2025, Rafael J. Wysocki wrote:

> I tend to agree that such annotations might be useful as heads-up
> markers for maintainers if nothing else, but what about missing
> annotations?
> 
> Is there a generally feasible way to figure out that they are missing?

Maybe we can use some LLM to help us decide whether the code has been 
written by a human or LLM :P

>  And if that can be done, "suspicious" changes may as well be caught
> this way, so why would the annotations be required after all?

I am not sure whether we have more options than documenting this 
requirement, and then work with our usual tool, which is building trust 
(or lack of thereof) in the individual submitters.

-- 
Jiri Kosina
SUSE Labs


