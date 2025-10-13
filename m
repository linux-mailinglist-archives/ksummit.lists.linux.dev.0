Return-Path: <ksummit+bounces-2511-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D916BD63C7
	for <lists@lfdr.de>; Mon, 13 Oct 2025 22:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D80F34F6B25
	for <lists@lfdr.de>; Mon, 13 Oct 2025 20:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0381B30B530;
	Mon, 13 Oct 2025 20:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="dFswlP+D"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9840830B533
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 20:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387798; cv=none; b=cyE1aPoauQ6mGxDdK7gSo+ndrvFqHFTJz+i0bXFmVgxtN2lv49f/CbKGwOIzxKuD+kL3EX5OFjK3MxfhCgzYClJCUdNIdxEDD2mDEnlntBcMo9o11F+UxTF8ALhW7PZbtaxWO+yi6DI1HXpMOR5Gv00ZNZYLdUoK5xf/x7UbbsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387798; c=relaxed/simple;
	bh=eb3Foq3QZmpsceuPRc0b3p6vWehv1JyVQsnodFCWpio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nie3o5SRbpXFLjHTCCio/6GyusyAfKJpKKr1RJGkHC759QSHVlbQeLsD7vFRl8hDFI34dYdk/Se4pg97Sdgvyury45zyyDUpEXqJd+sMtv30twTJUOGzfcE4GwtGkwkklup3pBEmarWaNuQQQyJNVIxCGlyO+UGBZ/49nNqHmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=fail (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=dFswlP+D reason="signature verification failed"; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [IPV6:2601:646:8081:9484:201e:bc0f:a7c6:ca8d] ([IPv6:2601:646:8081:9484:201e:bc0f:a7c6:ca8d])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 59DKaU9l1461960
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 13 Oct 2025 13:36:31 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 59DKaU9l1461960
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025092201; t=1760387791;
	bh=Tc7fJxWmls+Sa7wgiLm5oLozNz089Qh1RdWjVp/iBwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dFswlP+DPcTmIk7/IGqnO8wfjxDjxDx/DExh1Bc2T/k8s9As1rfacRtPtkWjkoWyT
	 uzpbmqYgBeJGsI68/sHwg3iFdzou4jog3F0A4z9nv4HW0ZHqLtCugEqxZN2a5kc84n
	 dCdJDlnCKWYVNAMJ7GBCqxQP1qg7zQDmIcgl3XTLYNoeAOBzZrutvb7PLYnqHmZoZP
	 ElnJQS/l0vR88Q5y3JJDKql2BbRitLbosJajGBs3Gl4dkm7T4w1BIYzVO/7TFyBt2r
	 T3H1UhxrYe/D3iP0/M5bMEyORk7Z16kqxG5GYzRPtKm0f2RXVJm0TypKE1A7pqsxMe
	 25P+VsIJwhnsg==
Message-ID: <fdc06bcb-9e12-4497-817a-34d650ecb107@zytor.com>
Date: Mon, 13 Oct 2025 13:36:25 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing Link trailers
To: Doug Anderson <dianders@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Steven Rostedt <rostedt@goodmis.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
 <20251013133913.015f253b@gandalf.local.home>
 <20251013175031.GJ354523@mit.edu>
 <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
 <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
 <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-13 13:34, Doug Anderson wrote:
> 
> OK, I found Sasha's RFC [1].
> 
> The first thing I note is that "b4 dig" takes a Message-Id as an
> argument. So now I'm confused. I must be misunderstanding the problem
> we're trying to solve with the "Link:" tag?!
> 
> From how I've used it, the "Link" tag allows you to start with a
> commit hash in Linux and then go from there to a mailing list post
> (and/or Message-Id). ...and then it was suggested that we don't need a
> "Link" tag (or anything containing "Message-Id") because "b4 dig"
> solves the problem. ...but then "b4 dig" needs a Message-Id to work?
> Eh?
> 

So "b4 dig" needs to be able to decode the Link encoding schema (which is
pretty trivial: the final path element of the URL should be a URL-escaped
message-ID.)

	-hpa


