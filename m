Return-Path: <ksummit+bounces-1749-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1BA3DA15
	for <lists@lfdr.de>; Thu, 20 Feb 2025 13:31:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FB551892DC0
	for <lists@lfdr.de>; Thu, 20 Feb 2025 12:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4121B1F584D;
	Thu, 20 Feb 2025 12:29:03 +0000 (UTC)
Received: from a3.inai.de (a3.inai.de [144.76.212.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449661F540C
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.212.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054542; cv=none; b=DoxXH9Ke7c4NZ24M/mH7kdzI6W2rqYvraf5xvZMK+pm6q7mIiY5T3o27RFT13z/1+tZuX6QMAvKWM0ZoTTLqfL8Rq7cvYnQboc/El7MZlFvjNanR8YqguWdnqZx/AmWbmyUfaRVV1lCSAVJPNb5YSF4HSPbcAI72cz0INHRldn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054542; c=relaxed/simple;
	bh=4hTAvpCCydUl37NR9f8gEyHJQqbKKwoNt9I3CB+pKkc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YbeRGQ+siXGL0HLTWSI7I2sjL+4sD4r9aoZe85pI8EB+c4eNFsA51wI2GY/ZfFnPzxRPv9/ZqzW8WwHuE3KmhweU8w0X+LMGhRQk8t6A5y2LuTPYmQF1A2aE7IoOJ+hUUtjYmv+M72jJYNKcAqwjSVgb+ofTQ0cE8626w4GFQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inai.de; spf=fail smtp.mailfrom=inai.de; arc=none smtp.client-ip=144.76.212.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inai.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inai.de
Received: by a3.inai.de (Postfix, from userid 25121)
	id 39CDD1003CE9E8; Thu, 20 Feb 2025 13:28:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by a3.inai.de (Postfix) with ESMTP id 37F641100B0CC0;
	Thu, 20 Feb 2025 13:28:58 +0100 (CET)
Date: Thu, 20 Feb 2025 13:28:58 +0100 (CET)
From: Jan Engelhardt <ej@inai.de>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Boqun Feng <boqun.feng@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
    Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
    Christoph Hellwig <hch@infradead.org>, 
    rust-for-linux <rust-for-linux@vger.kernel.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, 
    ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
In-Reply-To: <2025021954-flaccid-pucker-f7d9@gregkh>
Message-ID: <2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com> <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com> <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com> <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home> <2025021954-flaccid-pucker-f7d9@gregkh>
User-Agent: Alpine 2.26 (LSU 649 2022-06-02)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wednesday 2025-02-19 06:39, Greg KH wrote:
>
>The majority of bugs (quantity, not quality/severity) we have are due to
>the stupid little corner cases in C that are totally gone in Rust.

If and when Rust receives its own corner cases in the future,
I will happily point back to this statement.

