Return-Path: <ksummit+bounces-365-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 693663C1FD0
	for <lists@lfdr.de>; Fri,  9 Jul 2021 09:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 3FA8E1C0F23
	for <lists@lfdr.de>; Fri,  9 Jul 2021 07:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1602F80;
	Fri,  9 Jul 2021 07:03:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A3370
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 07:03:32 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id a127so7893298pfa.10
        for <ksummit@lists.linux.dev>; Fri, 09 Jul 2021 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cacrEwqK4aP9BsmMXnV9VXraSWg/rjV+l99X3CmekQI=;
        b=eqjNEpIAWaO7FqErG+p9+J69i14mOEFO4u7MbaqrPSjUoLzHu2sG/bXdqm7j28GAOa
         c9Z1rZbn7mymkCd/K4ala36ZCJWsWaJyVbS3rNx62Psmwi2Xh3aWdP8POymvx/UDCGs9
         OwSR6/EyEl+3Rw1LF0E33i+8SWg4NVf/kVmgMdtKkMYwnaEuEnauQAaBnJYjpuaXy4gh
         0hnD+S1D58/tvXuyed+ankJA0uAyBm+qOUKbX5yPHHSukO4Av5xa+n7Tq6KmJOrnCM4c
         RQ76ctKjHUYKmsn33EGaVm5AlPKEpaXOdUPTmZLbKLU0lsYjlWhRfysgsh11AE7XC0JT
         LgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cacrEwqK4aP9BsmMXnV9VXraSWg/rjV+l99X3CmekQI=;
        b=BqSCG8HZ37JDrt0QNocK7CZ6x4tPcAnZdJKI+B0677lt3LKFCZ+QpUYFuvO1X88Qjn
         KeR6ZYJ8musoaDqeR4jon8Ubc5vOfEoBmSdHJy9Rlbc+iKg7l6BZsx6yngyshBeYc6xs
         VYqlIYoLKgrJjGow4GlHAZMyjAuGMkSB39vUoPenzCBvcqpNSfEKUXiVPIsBpAFpJy38
         eVuKE6HIbm1opd3Fxz2vbVYHI1iItMvjMp+48VE7MUwuVEqxRZuH9Vxi61Z4HO9gZc/B
         ixrjuQODymHuWQYzfE3jyl0AYRy5zu1ahATGiZFFhjM5M8gCUpP7efI5NqyheSvw5WEw
         uh9g==
X-Gm-Message-State: AOAM532XfPsPdu21J3Re8bgD9lOlWnu23pfEUCKsQZ9mgflZHBceVLQd
	Jwm1razwtZrWtVFRElTZQyA27A==
X-Google-Smtp-Source: ABdhPJzsZiYJw4laP2LrkaPQLViOnl/6g3vDTG2PNqsGwhFj4NjX5eA1SKC6RmKLmq+tPhHpFFfzYg==
X-Received: by 2002:a63:af18:: with SMTP id w24mr36268801pge.375.1625814212103;
        Fri, 09 Jul 2021 00:03:32 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id e16sm5221126pfl.176.2021.07.09.00.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 00:03:31 -0700 (PDT)
Date: Fri, 9 Jul 2021 12:33:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>,
	Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <20210709070329.uhpoqnttqu3uw2am@vireshk-i7>
References: <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52

On 08-07-21, 21:49, Linus Walleij wrote:
> I also Cced Viresh Kumar who I think is thinking about Rust these
> days, using it for one end of a virtio pipe (IIUC) and Andy also brought
> up virtio, but now on the other side, in the kernel.

Thanks Linus.

Just so everyone is aware of our work with Rust, we (at Linaro's
Project Stratos [1] initiative) are looking to write Hypervisor
agnostic low-level virtio based vhost-user backends, which can be used
to process low-level (like I2C, GPIO, RPMB, etc) requests from guests
running on VMs to the host having access to the real hardware.

We are still working on getting the virtio GPIO spec merged, but the
I2C stuff has progressed well. Here is the virtio backend I have
written for I2C in Rust:

https://github.com/vireshk/vhost-device

It is under review [2] currently to get merged in rust-vmm project.

-- 
viresh

[1] https://linaro.atlassian.net/wiki/spaces/STR/overview
[2] https://github.com/rust-vmm/vhost-device/pull/1

