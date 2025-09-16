Return-Path: <ksummit+bounces-2392-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D8B5926B
	for <lists@lfdr.de>; Tue, 16 Sep 2025 11:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DE941BC39B9
	for <lists@lfdr.de>; Tue, 16 Sep 2025 09:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE2D2BDC02;
	Tue, 16 Sep 2025 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ll+ONLhF"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C492BD590
	for <ksummit@lists.linux.dev>; Tue, 16 Sep 2025 09:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015545; cv=none; b=Si1QQWlZFHLAZ5/96XuWbrQY3MQaOGv7vhH7R7mOtk8ttbJ680UHZ7YKga+fUFvO2MXbq+t4JzbKkgi+84OINDtoUwwAEYxJv6wyg/23FAuVgzWvHTR9o7gDNg7EytwIgLA3JH1fWAK6B0vq1c+Gz23S9uS8rDJz8/ojlfxVT10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015545; c=relaxed/simple;
	bh=UCWwFDiR48pAyEmAwql0uyeXmE5k5aZAgO0BGTBiuRQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MbkgiMEjRRgAnTyB9Es1gpKZazHZIe6XraVGLST5fLwPmUczK5HUVXXmHb0Ww6bLT7ksLe7XXmLaYJ0yBlpjzSSw8iW2xg2RMFljlvZXeFy8tD7w/L4nDFQkM0v6uLbrZuPXkedLiU2KJVjkZRgMWAtw2btUWtaNIxjTYm6CTg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ll+ONLhF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C74C4CEEB;
	Tue, 16 Sep 2025 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758015545;
	bh=UCWwFDiR48pAyEmAwql0uyeXmE5k5aZAgO0BGTBiuRQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ll+ONLhF+WYsGn4/LGJew9kJNfs9hX2cHOCVKaqvKoolAd3Ai3tuBbMJ3Dbf27wZr
	 s7keop/QfduTerynrVLV19FEMVQyNJQzfyem5Ua3cKDKFYccgmKFFfZiGLLJRQvmK3
	 LkAOgqM/rhT6kzniOXh5jPWfl2pGoKYo1j6J2bdJvEkrntX8pLnyV0PH8H9DLv3YQh
	 QOv6nqsz1PmFTukgmcM3HftKIodEjiaFAOGomMWucgBAKRuyr0KbDCa9UGrHL4/N7h
	 DE4WcJ+XAM2rYRTRYyOY4WBYPgQzQrmy7PjQaAHD9sksTIHLzxmAM1dSeNzESxI8ra
	 EzcwE0IaQv8WQ==
Date: Tue, 16 Sep 2025 11:39:02 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Kees Cook <kees@kernel.org>
cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
In-Reply-To: <202509151019.CD7AA0C0BE@keescook>
Message-ID: <noq7ssn1-9657-6869-1257-qo0ps32no46s@xreary.bet>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz> <202509151019.CD7AA0C0BE@keescook>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Sep 2025, Kees Cook wrote:

> So, what I mean to say is it's certainly useful to declare "I used a
> chisel", but that for long running sessions it becomes kind of pointless
> to include much more than a general gist of what the process was. This
> immediately gets at the "trust" part of this thread making the mentioned
> "human understanding the generated code" a central issue. How should that
> be expressed? Our existing commit logs don't do a lot of "show your work"
> right now, but rather focus on the why/what of a change, and less "how did
> I write this". It's not strictly absent (some commit logs discuss what
> alternatives were tried and eliminated, for example), but we've tended
> to look only at final results and instead use trust in contributors as
> a stand-in for "prove to me you understand what you've changed".

Thanks, I understand your point.

I, however, don't think I as a maintainer care at all whether the patch 
has been "assisted by" some LLM when it comes to proposing testing 
scanarios and testcases, managing the testing results, yada yada yada.

If the patch author wishes to express that in one way or the other, just a 
freetext form in the commit log is completely fine for me.

I don't think we care about that aspect direcly neither from "maintainer 
workflow" nor legal perspectives (IANAL, of course).

But we do (or should, I believe) care about the actual submitted code 
having been produced by it, for both of the the reasons above.

Thanks,

-- 
Jiri Kosina


