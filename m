Return-Path: <ksummit+bounces-2506-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC3CBD5F61
	for <lists@lfdr.de>; Mon, 13 Oct 2025 21:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26F6F40765F
	for <lists@lfdr.de>; Mon, 13 Oct 2025 19:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C77825783C;
	Mon, 13 Oct 2025 19:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Y7239oyM"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E44D2DA760
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760384139; cv=none; b=WdO4GpGGzAiFNDkWbkqelLucdTecC3zqp+yL8qv6sWNpvDg7Q3icxi/ihDiR+Pz95lIGZL4HdEKeTrOmrb6rh2Erf14yl/dJ6jCNzicMEQw1PLlabhq3uXtNfH9xvVGU/yMLl/m51ZTNqS1/d6s3QFVnlgAyaSXMDiZvszkZmpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760384139; c=relaxed/simple;
	bh=cW2vUaHIPzFv3ub6bSGhVBKDgq94FcSRVOtbN/E2jL0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rLQjd4fHP4c2axZM2zcloxjHuLm53RWhCu9npXjPiKt7OcF2sG7b6uXBynSZteNzX7RZlpSLxKhdS1GziwgcoRApkxU/CW9zFgt7GokRK1i/g+EJqNbw0lIZzG+GQpdGu4YMwX6eSZF+gY+7TwDfW4G/VwCYKU7ccTee2IG7yT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=fail (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Y7239oyM reason="signature verification failed"; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [IPV6:2601:646:8081:9484:201e:bc0f:a7c6:ca8d] ([IPv6:2601:646:8081:9484:201e:bc0f:a7c6:ca8d])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 59DJZVVL1439131
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 13 Oct 2025 12:35:32 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 59DJZVVL1439131
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025092201; t=1760384132;
	bh=FTBr9DGcMvBxx8JTaj0dGHcif5K67i4dMvn3jfUSvG4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Y7239oyMl5nrgbB+jiNrK2Ob130dAXEbmDTS47SVAx1/Wbzd+BQZlBj+iZPtX1XpF
	 70slnASAzQoCjaVVKphXSrrk/mY1pcgz1fKKi3Ola7DB5Y39I6rkojuSYDGrpVUUEq
	 Hhp067kONXQE2OZ0pnk7MxOZbW9kdOCHilwKCaD9BMY06Oj80Hxf+wh5TAbk9lL2AC
	 +SlYXrXbNoPX7i7Lge5zyHIvN0f+CLb9HMJE0JtXppA+wRj7FxDkBeFh4hxT2Jue9N
	 rYwUEyv6io//C3eW4kiBBT+02b9HMS4hD0T1xbAb4F6jKnPnYRwzp5umAvTnYQVC47
	 6a5uCvLUnRWUA==
Message-ID: <8de103b0-071b-4066-83b4-b1be1f43d88a@zytor.com>
Date: Mon, 13 Oct 2025 12:35:26 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing Link trailers
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        Doug Anderson <dianders@chromium.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
 <20251013133913.015f253b@gandalf.local.home>
 <20251013175031.GJ354523@mit.edu>
 <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
Content-Language: en-US, sv-SE
In-Reply-To: <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-13 12:07, H. Peter Anvin wrote:
> 
> Oh my.
> 
> Irony.
> 
> This was the *original* definition that I proposed, which was vetoed by Linus because it didn't provide a clickable experience. The compromise was to have an URL schema that:
> 
> a) fully encodes the message ID, so that the death of any specific archive doesn't mean irreversible information loss;
> 
> b) is encoded under the kernel.org domain name, so it is under our direct control. 
> 
> In IETF terms, we want an identifier that is both a URL and a URN (senso lato.)
>

Another way to look at it is whether to put the bulk of the burden on the
sender or receiver. There are arguments both ways, however, I think Linus does
have a point for a couple of reasons:

1. Move burden away from the maintainer/reviewer.
2. The number of tools used for *reading* usually vastly outnumber the tool
   used for *writing*.
3. A resource name provides no hint whatsoever as to how to locate and
   retrieve said resource. git is used for many projects, and so it isn't
   reasonable to automatically assume any one mailing list or other
   collection, such as LKML. Thus, the Message-ID: alone is insufficient.

There are a few downsides:

a. It implies a default user experience; visiting an alternative archive or a
   local archive requires decoding the link back to its original.
b. Mis-encoding at the source or not using an approved schema violates the
   constraint that the resource name is recoverable, and it may not be
   immediately obvious (early on we saw a lot of Link:s to lkml.org, which
   did not encode the message-ID in any meaningful form.)
c. It makes it at least somewhat harder to deal with links to embargoed
   discussions which will become public, as it is unlikely the embargoed
   discussion will be archived as the same URL as when it becomes public.

Personally, for me, item 3 is the one that really clinches it. Since
Message-ID alone is insufficient, I don't believe it is possible to trust the
user to encode all the appropriate information in a way that is generic across
projects (the original proposal was for an ad hoc LKML tag containing the
Message-ID). The Link: tag provides at least that much of a general solution
to this problem, and it can also link to genuine web resources for the kinds
of projects where this kind of information is not processed via email.

As far as the downsides, all of them can all be handled with tooling in the
form of an URL pattern rewriter. This is very easy when a link is invoked by
executing a browser; when it is internal to the browser and/or invoked via
some kind of IPC API then it gets more difficult, needing a browser-specific
plugin or using a proxy.

As far as Patchwork is concerned, that should be a rather obvious feature
(encode Message-ID as a Link tag) to add to Patchwork. There are several other
features Patchwork really needs, one of the main ones being a way to supercede
an individual patch in a series.

	-hpa


