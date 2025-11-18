Return-Path: <ksummit+bounces-2627-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27253C6B6A7
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 27DD034E105
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2D12F0685;
	Tue, 18 Nov 2025 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="d3Tpl9BH"
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383681DC1AB
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 19:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493416; cv=none; b=Ebo1fOuSbpS1A2ko3zvLYf9+lVuC6/0PJyth0pqLXSvPir1RytzsKNHikYrkvAWefCR/VXSuVX2qY+IGLHGPBRv0XUU4jawumRauB+fe95G2ahjmcC17GNeWtzALJJw6yUEXGnJM+5vtk3kU0s5y+vEqlsG4TqRA0IzwZff+0GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493416; c=relaxed/simple;
	bh=dguQ39Mep95lsNVlswROae6AuZPZ3K+uRVJ4Zk46DlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bM3VGEF/8q8C7CpqD7hUBA4dwhWedofioUc26pWqhehnPsVKc9K+yOjRrHg8C005xcIAVU1A+YMQ5U2JMX+UhP0iXi6UitbtRvyXu7Z3I86BfL7tXk2MP2Sk7DOOe5mL4DQWE03axrCm4iMNFqAH0qxfSJNwWdLcFZeLFXQt7YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=d3Tpl9BH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b728a43e410so956620666b.1
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 11:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763493412; x=1764098212; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xMWK7z/QaG7+80gfORHTkxq5LBqE6WG59E0U9AbQEdo=;
        b=d3Tpl9BHITaqbLYYIl4dSaQ8tare8vh3abqs7Age4wRqy/xZ61EnxT2WE71sccRDp7
         SLnZ0T3PB/B211zwqysSpUkStm0b5Wx2VWdS3JVd0BDXpryQoTSAaqcJWdcder8lT6/O
         AIWm1glxS5iaycZJMaQSOK8H/gwSL8/FeFLTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763493412; x=1764098212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMWK7z/QaG7+80gfORHTkxq5LBqE6WG59E0U9AbQEdo=;
        b=GfnWXrQe8hRePlbs9tPznSLhkt/2ruidqV+ezhYC+WiV+N6UNe8jizJArqAM4/hVto
         sIRtWUQCNQmVXhyte/TPTqoIXZCxgyoRx57omBiQaTsNWWOEeNU/t8MX5MaMBt8bfpJ0
         iTY6it9Kx+vHVfBi/rOK+HnYljrNaQp/gbPjt15fA8IicLkEbGJZ/AZ45RcHrX9viDo5
         m81nLIpHf7n3WuNPuvXuv2NXJBOxwwaffdJcDXO1Ddy5dIGqN4xESUZMDM8qQy+J2FRi
         EPteX7XsjM9Wrz05cfjzg9BOfLRk/OpvrYC28I8wALZJJlcPCjeJ5Y0ZjO/VwFf8FFq/
         Dq9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUebaAs5poMPjtCOvaECDpJtUCe2Q4uMleF00vK3jeVd7Z6sPaHjEUFjwCXc92QYQ/rXkH4lZGi@lists.linux.dev
X-Gm-Message-State: AOJu0YxEql7/2aB2IxvbeuNh9MZzQ3onXsHPqfaUJ2bMPUZo/B5+B7NB
	y3/K7Tnm3hWjaJ3fGTbnTGQhn494415fTxDMLTVIWP7bJsukU9V/LPZkbbH/3MwCXhttMYV7yOD
	UQ1IaQTs=
X-Gm-Gg: ASbGncu1/Ba89z5CZ08sp3WxVoD7Wj8AcTOg3lKvJAX7xVYs7F7aF/pV5GOHM8j5H4l
	ZZWneFY7NZq1ftRV7bXpTTEOMEUxBss3dpK4zSvRajS37WkYZO0AyOnCeaG1yMBVfw0Dxj3q+nv
	O6Ue4fJFHmIhIKWgTHrIo3Nc3ntzAiOdUzE+Shw/C+GUsMjHJAE9/0KftAr7AU3cKC/f2ineTBW
	V/9pyGIFVCL+FCQt90CaBHKQ9EYpThTw/Gf2roakghlHD9y6eGYny04HOwtrCL5gCA6kUAWJO+P
	aIU7fvIHr2O1OUNEVwoLKYKMfQ0JkAyY/gMK6mGJ8Fx9hatyWzwDmTj1Wl2/P8qg7CDIPPKE3lV
	mH+5UDJ5pT8U1tQ1teUjG1b+LNeEfZzXCdy46viO0EXHvnoF0EiuAgT8blVEQbPliAC/ZUd/38T
	UW5Cq6KdNmu1i2zgA16jSIpp2lZVXiaHgmHTra8Lgg3IOztGw4ujpvUWOeJSzI
X-Google-Smtp-Source: AGHT+IENNEjo3GvS9l5/nmIxqkgc727MlA78BzIBTHvj25Rg/+4SaDUlk3C16QhWrJRI9xD/msT5pQ==
X-Received: by 2002:a17:907:6eaa:b0:b6d:505e:3da1 with SMTP id a640c23a62f3a-b736787dba1mr1827096466b.7.1763493412171;
        Tue, 18 Nov 2025 11:16:52 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb91bsm1406076666b.70.2025.11.18.11.16.51
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 11:16:51 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b73669bdcd2so809891466b.2
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 11:16:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXjgdKiQ3FjyV8QgI7S6ychDNDVfsqzLoW1vZIhPfc0ibw3Dw7wUPLGlC/w8z4y8UsCj2T4Ji1o@lists.linux.dev
X-Received: by 2002:a17:906:f58b:b0:b4a:ed12:ce51 with SMTP id
 a640c23a62f3a-b73678b33c7mr1700987966b.23.1763493411034; Tue, 18 Nov 2025
 11:16:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org> <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
 <f895328e-43f3-426b-ab2b-ee750edab324@zytor.com>
In-Reply-To: <f895328e-43f3-426b-ab2b-ee750edab324@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Nov 2025 11:16:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjvPScU4HrhFL9dusAOLRA0E1qi2t6tEo2mJ0Tvghkd2A@mail.gmail.com>
X-Gm-Features: AWmQ_blEzsk120mHnSClTd-JS9vPHaABtZs1TtzfLkaN49foVWGZxT1NzXXF6Cw
Message-ID: <CAHk-=wjvPScU4HrhFL9dusAOLRA0E1qi2t6tEo2mJ0Tvghkd2A@mail.gmail.com>
Subject: Re: Clarifying confusion of our variable placement rules caused by cleanup.h
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Bart Van Assche <bvanassche@acm.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 11:11, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Do you want me to send you the patchset during the merge window?

Sure. I don't think it's a high priority, but I do think it's an
improvement and allows people to write clearer code.

I assume all the conversions got acked?

            Linus

