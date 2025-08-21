Return-Path: <ksummit+bounces-2190-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2AB30769
	for <lists@lfdr.de>; Thu, 21 Aug 2025 22:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96DD8B0730C
	for <lists@lfdr.de>; Thu, 21 Aug 2025 20:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFA13126D9;
	Thu, 21 Aug 2025 20:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXpDQg6w"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1B83568EA
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 20:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755808688; cv=none; b=ZDanUF4YncSRStXrAsVsZgkrH7YvcGkZL1KuhD88lxVp/tXX4tDdjXgnCTBU0XrHrqa4Z41YDRqGHf8L3B9uPM2pwajIC2eXkQ2NAwLHyi1j6owrNyiyMwkr3SIbAnXfOauRyaLPvUYh2mqzjXjAg9tjMp993R02N4B2OvIbhe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755808688; c=relaxed/simple;
	bh=gskXFy3QQVhZxXIXO6V9A/gnWJ9hyHePtJEd1XYa5jw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PV2mvdnBfWQYErRmuQ+ECkmIZ57r0hgtvRRfjkyxzRs+3UUMCEgZluQ0KlnLkQtCO4LDngexcjmflHjWupRPQSbfai51ypDHzN6MWexFo6oGaASztP9cyPR54l4E7ABlLRH8BPgRpoJGHpdBnHJzA/RmJjGxaKSWj2xpv/OAh6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXpDQg6w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B9FC4CEF4;
	Thu, 21 Aug 2025 20:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755808688;
	bh=gskXFy3QQVhZxXIXO6V9A/gnWJ9hyHePtJEd1XYa5jw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XXpDQg6wFy5L9w4jRcB3U5F/U8JLrBuOf3CGq5CotXzjsYbWozZR/1Q5mlYJ8QWUH
	 HpPS15Ki/2FvLS8dMejkQgGBD9RC79bIzvySEcxVK1TjQDPaDMcUmFwkxqAGBavtnQ
	 67G4NZVdlov9PClCQ+dsZsVW65bx5ggPyQHKNU2Di4+S6O7FUJW1fMSYTMrCtTrvDj
	 Wxo95i2qWcn/3viywiUg7Ci0UUpmeutIEAc0jcgKWBZ5M37pweQ7dsvitJknWvSTUs
	 /mt8MomGMBpYz6QmzTRMoDRREd7YTwwzY4VjlUTiX6H8q2JC+81cNGRjtLlQ7LhXyf
	 qDCOwd6xcP0Yw==
Date: Thu, 21 Aug 2025 22:38:05 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
cc: "Paul E. McKenney" <paulmck@kernel.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
In-Reply-To: <20250821122329.03c77178@foz.lan>
Message-ID: <o8r437r9-30sr-o187-8599-qss9p3p7303o@xreary.bet>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz> <aJJEgVFXg4PRODEA@lappy> <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org> <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop> <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop> <20250818230729.106a8c48@foz.lan> <9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com> <4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl> <d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
 <20250821122329.03c77178@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Aug 2025, Mauro Carvalho Chehab wrote:

> In any case (either AI, human or hybrid AI/human), if the code has issues,
> we may need to revert it.
> 
> On other words, AI doesn't radically changes it: at the end, all remains
> the same.

The code is rarely 1:1 copy-pasted, both by humans and AI.

Transformations are needed, you need to glue individual pieces together, 
adapt for a different version of API, yada yada yada.

When done by human, there is some hope that the human does understand what 
he/she is doing in the process, and you can reach out to them for 
human-to-human discussion about the code.

With AI-generated code, there might be no such human to talk to who 
understands what the code does and why.

And one of the points why I originally brought this up is that I believe 
we need either (a) be able to take the informed decision/risk by applying 
a patch we know has been written by AI, or (b) be able to outright reject 
it on that basis (e.g. if it's too complicated).

-- 
Jiri Kosina
SUSE Labs


