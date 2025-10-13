Return-Path: <ksummit+bounces-2504-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 431D4BD5E0B
	for <lists@lfdr.de>; Mon, 13 Oct 2025 21:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A323E18A5D2D
	for <lists@lfdr.de>; Mon, 13 Oct 2025 19:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB3C2D3EC7;
	Mon, 13 Oct 2025 19:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="LNjGFD7/"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C4A1C860E
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382473; cv=none; b=cmJADzpAnUjmznb6RqNKBsVSRJoytRiTYB2+o/SNPTYazCqwISwRjCinO/6T3zGm+MHP/tWynHZPKIYoefZTbtWfMTsa9R03NiXvjz7LqOQ4xgAc0mwfvpvJzECSWkUoeoO4/gx1kKafT6s2B/DzM46/zJJlxCCBVOFp2iO1Rss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382473; c=relaxed/simple;
	bh=i0eVpvWEh2/U9Qzol2PqQzxUcG5ifU+ujHIfAozmTk8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gWXtlNYZS6IgGQrXTYncAokBUPF7J9wH9rf4Ptb+EVpxVlnxsc12uABaVNgJFf5So1ZWIq8mBobLMkzIpfL/F7uMm/NoeusXPpSEWahu74zyU0wx8AF6KwOnkYCGHl1Wln2j3FqUKyGHUmNljRt7FVJitx6rEhLsYQ+cxjG543E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=fail (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=LNjGFD7/ reason="signature verification failed"; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 59DJ7fMs1427331
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 13 Oct 2025 12:07:41 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 59DJ7fMs1427331
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025092201; t=1760382463;
	bh=NmGLcLTkz7eFn6ePYdzTYWckzlqlSaZ/QFY1fC38B50=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=LNjGFD7/6Sz77u6PLipFoPg/kgbo1gMc7ZxORGlVYzRgRZEQTx/qD/fcDd1HIb+X8
	 VzAxfsQvZqd9o/pjCjuG5z5TMf6vGCL/KK9rHifXxodIkjMSyU9wZX1L+onHMFfmTf
	 8HtEurNthIJpLs8uKtgTUwwjoyejSA8IxSSNi88skbZB9/iUl80F9OL9gqETbenDfq
	 LTEs5vBXy049cuWbC14h6CWmDZOJCSzr4da+srOEFZXv71/HF8hWXlBQayxUKdrywU
	 G4BwbK6JLIytzhlf7uLdkwGesVm5moIwN9Kl3vQxzFt6TVsrDqAO7Ag38BG155JsPm
	 tV8GuVMO68gVA==
Date: Mon, 13 Oct 2025 12:07:38 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Steven Rostedt <rostedt@goodmis.org>
CC: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Doug Anderson <dianders@chromium.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
User-Agent: K-9 Mail for Android
In-Reply-To: <20251013175031.GJ354523@mit.edu>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com> <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com> <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com> <20251013133913.015f253b@gandalf.local.home> <20251013175031.GJ354523@mit.edu>
Message-ID: <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 13, 2025 10:50:31 AM PDT, Theodore Ts'o <tytso@mit=2Eedu> wrote:
>On Mon, Oct 13, 2025 at 01:39:13PM -0400, Steven Rostedt wrote:
>> On Mon, 13 Oct 2025 12:31:32 -0400
>> James Bottomley <James=2EBottomley@HansenPartnership=2Ecom> wrote:
>>=20
>> > Just on this, git format actually controls the amount of information =
it
>> > prints from the headers rather than the trailers (the git tools are
>> > really designed to treat the trailers simply as body text)=2E  Howeve=
r,
>> > that's not to say Link couldn't become a header tag instead of a
>> > trailer=2E
>>=20
>> I just need it to be visible from patchwork=2E
>
>Instead of the Link: tag, would this suffice for you?
>
>    Message-ID: <20251007134936=2E7291-2-jack@suse=2Ecz>
>
>In some ways, it's easier since raw the message Id is directly
>available in Patchwork=2E
>
>						- Ted
>

Oh my=2E

Irony=2E

This was the *original* definition that I proposed, which was vetoed by Li=
nus because it didn't provide a clickable experience=2E The compromise was =
to have an URL schema that:

a) fully encodes the message ID, so that the death of any specific archive=
 doesn't mean irreversible information loss;

b) is encoded under the kernel=2Eorg domain name, so it is under our direc=
t control=2E=20

In IETF terms, we want an identifier that is both a URL and a URN (senso l=
ato=2E)


 

