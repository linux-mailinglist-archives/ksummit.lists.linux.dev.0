Return-Path: <ksummit+bounces-1825-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDC2A40711
	for <lists@lfdr.de>; Sat, 22 Feb 2025 10:45:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C45470528F
	for <lists@lfdr.de>; Sat, 22 Feb 2025 09:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D64D207A2D;
	Sat, 22 Feb 2025 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0eLVGic"
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5552066DA
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 09:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740217530; cv=none; b=LC1tYBASSnawFC0jTv3EXCvs+YzTGi7+PzgCCDROu/AgT+v20v1ZnuvlllRMuq4pb/o0BIZdaJEP2B9BDp5fG7zeowWxEUdDZt1uxHNDDywDdSsXPuoNrNQ1fhvMphaMLULC2WGT3IV3m3Pj5djb9ULAzioEN6P7kMTajomrS6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740217530; c=relaxed/simple;
	bh=/kYuvKy7/80/umChhI5GL3TTiP+Ev/tebduW04InOnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMSnUzj7aFxUhvw1p4MzT5RxEhie2ARKV1K/CqIjDJAqNQxXcir8j0k949849cz7h4DopdJ8WHSiTHjW46fhrov612O1TItWroUwVnkLCYCRPj5FogO3G5mDwdbJEzFWcrmVRvPDgU54XevPLImJSDbV6wrrmVYgRscVNNpV3Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x0eLVGic; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e04861e7a6so5488960a12.1
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 01:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740217527; x=1740822327; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8wLepng4XkMI9RGlLOTj1pUX5I5VoWm+BgBglWXCmf0=;
        b=x0eLVGicMYRR82Zm91oGwM039Lt7GzWGUYtDqmbCXASkOm9RYEyTJhu3w9Gg1loadX
         LvmLPUBcg83CdbqGUg4JLxl0SxX8/gjVtMY80gvqMPdlfayKzvjp0lX6Ekku7ZOHYUi7
         XVQELZW12cjiapBm5PNRmdMbnaze7tvZNf3lD5MfDvy2zXJ+QrPMgwTKQOzwOTyT9fpk
         UjP5fURIl6Vj9Y+Se104Zg0jS7QFJFmlQiQ3JxA2zhnB0pbi7cOyX4tioV86hpvKJtMg
         JPC0ywbRSDujeHgOlN3lst6A4GhE28f16ODVoQOArmeOUu3J5QdMAPaSLIgo2xJjnmsc
         +baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740217527; x=1740822327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wLepng4XkMI9RGlLOTj1pUX5I5VoWm+BgBglWXCmf0=;
        b=AEKI6pr6uW+A36opJcuq0+aQzjHO+FBsdBfyUfiCjz6ebs4OMMJLMxZzlklizg7Y7i
         1hDRU+3OZo7r4qxtY/+m5Z01EN1pIGeBfqLyHo5U9epUvxDDU5h17uQ4bH0PTDjR72iA
         zrX/MRHcB98UOm7UOB43Yy7CdHDskZiVU2RukwgFYZ2DLIdwQEdJRLalKO/MZuEUjYkA
         cmfc26JiZGwoEEcBto+RYsHtZ5xbFnda9Dkqrj2gFH4G7A6taH7zo2Y/AZFdE2bcuz3o
         4av5BL6NCyQWC9kVQIuyahPOzagulNMLOF4nD4YgTeyOeXN9QtzuQA4kM7CViKrMUzdB
         sbgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfzY48eAjQ8NbvA478aI5p6etflaUwoKjx9N8EwMymmWMpz624m6zvuR2zLj+eDqwB7Ig+3eZv@lists.linux.dev
X-Gm-Message-State: AOJu0YzuVR/8mdJBC4O0KSV/9EnIDmgC09vtdkZEDseB5njrBUHSArj3
	K1ykD3wGT01S4S56Ty/RHPk+nLIs+FrNSmUugkAL+RdW22OQfcrOhWkl2n72SEk=
X-Gm-Gg: ASbGnctWuLCebMQdjnlpBTlWrdNkgIpx6iwX4Wzy+WJusj/DKYyIy+SP8ydyvmzmDRt
	AxWfmjz1eh9L2DVyvjUIYl/W8NxXP2DO2O8Hk/8HL5YBed7saLis6eOGgYh4Wn1fZ7QX2XZ0gaH
	+zMUaP+xx66LgyU6KnyS1iyK2GE/3KbC217I4hWaRIz/x4fADtW536F3vSB0Bn5f7vKwHU6ExO2
	n6XE3zed5j8NMGKo1MFGVzCEPHQxD6YE/8J7J1kQbUtZjD44hHXrzgI2rrkMb5jb7cKTfPTNKPS
	LbWAZ5z6YbyYfxB05CjmRLqXDVDJm0g=
X-Google-Smtp-Source: AGHT+IGHvB4+8rYGb7CeI8nujAOkfaRvu2mrdw8RtO8EBRYKZ2Z9bKgc/J+JEdAHYwWQpTwbIRKKRw==
X-Received: by 2002:a05:6402:4313:b0:5de:4b81:d3fd with SMTP id 4fb4d7f45d1cf-5e0b70fa0efmr5984968a12.13.1740217527041;
        Sat, 22 Feb 2025 01:45:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece287d13sm14943991a12.68.2025.02.22.01.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:45:26 -0800 (PST)
Date: Sat, 22 Feb 2025 12:45:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Martin Uecker <uecker@tugraz.at>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <1cf1d64b-128d-4dbe-8427-98405652944b@stanley.mountain>
References: <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh>
 <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <2025022042-jot-favored-e755@gregkh>
 <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
 <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain>
 <61a7e7db786d9549cbe201b153647689cbe12d75.camel@tugraz.at>
 <20250221124304.5dec31b2@gandalf.local.home>
 <CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com>
 <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b3e4d3bdc9b6efd69068e5b22cfd05d370aed19.camel@tugraz.at>

On Fri, Feb 21, 2025 at 07:31:11PM +0100, Martin Uecker wrote:
> > This is non-negotiable. Anybody who thinks that a compiler is valid
> > warning about
> > 
> >          if (x < 0 || x >= 10) {
> > 
> > just because 'x' may in some cases be an unsigned entity is not worth
> > even discussing with.
> 
> Do you think the warning is useless in macros, or in general?

This is a fair question.  In smatch I often will turn off a static
checker warnings if they're inside a macro.  For example, macros will
have NULL checks which aren't required in every place where they're
used so it doesn't make sense to warn about inconsistent NULL checking
if the NULL check is done in a macro.

In this unsigned less than zero example, we can easily see that it works
to clamp 0-9 and the compiler could silence the warning based on that.
I mentioned that Justin filtered out idiomatic integer overflows like
if (a < a + b) { and we could do the same here.  That would silence most
of the false positives.  It's a culture debate not a technical problem.

Silencing the checks inside macros would silence quite a few of the
remaining false positives.  In Smatch, I've silenced a few false
positives that way for specific macros but I haven't felt the need to
go all the way and turning the check off inside all macros.

There are also a handful of defines which can be zero depending on the
circumstances like DPMCP_MIN_VER_MINOR:

	if (dpmcp_dev->obj_desc.ver_minor < DPMCP_MIN_VER_MINOR)
		return -ENOTSUPP;

Or another example is in set_iter_tags()

        /* This never happens if RADIX_TREE_TAG_LONGS == 1 */
        if (tag_long < RADIX_TREE_TAG_LONGS - 1) {

The other thing is that in Smatch, I don't try to silence every false
positives.  Or any false positives.  :P  So long as I can handle the work
load of reviewing new warnings it's fine. I look at a warning once and
then I'm done.

regards,
dan carpenter


