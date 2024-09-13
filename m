Return-Path: <ksummit+bounces-1570-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3AE978503
	for <lists@lfdr.de>; Fri, 13 Sep 2024 17:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26CE281A10
	for <lists@lfdr.de>; Fri, 13 Sep 2024 15:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EC7374FF;
	Fri, 13 Sep 2024 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="KMZ6IfPM"
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF97DF60
	for <ksummit@lists.linux.dev>; Fri, 13 Sep 2024 15:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726241941; cv=none; b=pKDU93LjPrIfcpQDZ5xskqA0hZzadzZRlvYgHOH/LCmhf9aMAKqZcQ2s7BDvkygjPfLis8/AeHMP7gHdxDxtU76242ez9OsE9PAQe8alCQYVpHY7GQHct293zmwe2d8Chh+ENgAO0Xg/Xs853USgaXGo6pDfsAD2UJWJDwGtuIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726241941; c=relaxed/simple;
	bh=0MTxm8RIU8cBwqrxt0KrQMk9Pdz0FXXluditVDWKTwE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Efkigdxz5Jt75+lcL3OYcyVtQIR0LQR89wjYbcLErHDQdBayx5L93KMrOx/KPBsjMZnNOS4Li8i9U0LpOpP+ApkkVjoqXflgaqD/s0niVJMwZOkuR+p5ntgPCP7JD0JdYkpa7afzggu126xQzPaJJ+NxMRSeVUCBdEuDYdH++5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com; spf=pass smtp.mailfrom=arinc9.com; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=KMZ6IfPM; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 917A360002;
	Fri, 13 Sep 2024 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1726241930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MTxm8RIU8cBwqrxt0KrQMk9Pdz0FXXluditVDWKTwE=;
	b=KMZ6IfPMfI9fnboHcDzYxeuU33+bEb5l/7L6+uUfC3XRPnnnDqYU4+D275yq7bpWNhJy3t
	VorSkIjNtSI948kM0NwJgrTXJYFahy5JWpY0JcTYuT/oMKpZh8Xy5VO3Szn4bEz0Hte1bd
	vKQjGlFYtzkpCPIdYicfL1OZEnnDZaLBRvt7de8+AG03q5HrftQNr6VAscSEblqDGTiog5
	LfVNW0mmN7px20fMM73JbTnj/woVkWTr190lo5Q3W+rijxfbarzL2IJ8yFs5h02k8gbKyf
	/rNosY0XXfXyTAVys2lxqwEs/xlxZLyHz0wQxY/yjUtXNt11PakmeXb4iuQctQ==
Date: Fri, 13 Sep 2024 17:38:44 +0200
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: David Woodhouse <dwmw2@infradead.org>, Rob	Herring <robherring2@gmail.com>
CC: ksummit@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor	Dooley <conor@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BMAINTAINERS_SUMMIT=5D_State_of_dt-binding?=
 =?US-ASCII?Q?s_and_DT_source_files=2C_and_invitation_request?=
User-Agent: K-9 Mail for Android
In-Reply-To: <0ebbade1dd90305b4abf1315a2735f7f7caa81bd.camel@infradead.org>
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com> <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com> <32400a92-23c0-4ec3-9e42-29074e6db1f5@arinc9.com> <0ebbade1dd90305b4abf1315a2735f7f7caa81bd.camel@infradead.org>
Message-ID: <074766B4-C125-4514-B57D-043473819A0B@arinc9.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: arinc.unal@arinc9.com

On 13 September 2024 10:08:41 CEST, David Woodhouse <dwmw2@infradead=2Eorg>=
 wrote:
>On Thu, 2024-09-12 at 15:57 +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote
>> Over the course of years, I've had maintainers resisting to or complete=
ly
>> blocking my changes on the device tree definitions because of Linux dri=
ver
>> related reasons=2E I couldn't have patches that fixed incorrect hardwar=
e
>> definitions to be applied, because the maintainer would demand a change=
 on
>> Linux driver to happen beforehand=2E I've stumbled upon misconceptions =
such
>> as thinking that a Linux driver change could break ABI=2E In reality, t=
hat is
>> nonsense because a driver change represents the implementation being
>> changed, not the bindings=2E The implementation change can only be so t=
hat it
>> breaks compliance with the bindings=2E
>
>
>We should be careful here=2E
>
>The device-tree bindings are the definition of the ABI=2E But they are
>only words; what matters is the interface between the DT blob itself
>and the OS drivers which interpret them=2E
>
>If we want to *change* that ABI in a way which breaks users of it, then
>of *course* we have to consider a transition path for those users=2E
>
>That's true of *any* ABI, be it a command line, a library ABI, or the
>device-tree bindings=2E

First, let's agree on the two cases of changing the ABI=2E You either add
new properties and rules (let's call them definitions) to describe the
hardware more in detail, or you change the existing definitions which
would break the ABI=2E As it's irrelevant to my point, I'll simplify the
valid reasons to break the ABI as: The existing definitions wouldn't allow
the hardware to be properly described=2E

>
>So where you say, "blocking my changes on the device tree definitions
>because of Linux driver related reasons", that isn't necessarily wrong=2E
>A breaking change to an ABI *needs* to have a transition plan for how
>its users get from old to new without a flag day=2E

This is a concern for the Linux kernel=2E If we demand the compliance of t=
he
Linux kernel with the changed device tree definitions from the people that
made the change, then we can't talk about a complete autonomy of the
device tree development from the Linux kernel development=2E I should be
able to submit patches with the only goal of adding or fixing hardware
definitions=2E Either I've broken the ABI with a valid reason or added
hardware definitions, I must not be forced to do Linux kernel development
for my device tree patches to be applied=2E I should not need to know the =
C
language to do device tree work=2E If we want more folks to do device tree
janitor work, let's not add in unnecessary requirements=2E

Device tree definitions are not just for being compiled into a blob for
drivers to interpret=2E For example, I do regularly read device tree
definitions to learn about the hardware being described=2E So it has a use
for documentation as well=2E

Ar=C4=B1n=C3=A7

