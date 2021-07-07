Return-Path: <ksummit+bounces-275-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314183BE0EF
	for <lists@lfdr.de>; Wed,  7 Jul 2021 04:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 9E1813E1097
	for <lists@lfdr.de>; Wed,  7 Jul 2021 02:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1135B2FAD;
	Wed,  7 Jul 2021 02:41:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B631168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 02:41:16 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 21so849404pfp.3
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 19:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6KcHJK3zP+vfvBTXst3lFhLL8aUJ3Vu86b3sjNkgY7c=;
        b=BGNqtUAhFiNpY+gjERcIG7WKv8scgik5UpA+Itgk/coNWol5O5vsqHs19RtoOjoH/R
         WpVAqhgm/T1v8bAi9hwsNPXmLqRTwyRcm5Vy12rl5726Ahs+zs3vUN1WfIqihM3rThW0
         jczX0HNJbrwrMXtvraKVFBvFtZCg2y4X9YiJvP80oROVEPKZRlvRWCDvP11me3/J/GHz
         13fPrQUJ+gx5CWYlfxrhfECllFP5cyW1URv6gaWJWFtrifoiYeDeIKxbpraiWKV8C/z3
         7whxlhc9zQw61J2SGvg49Zig51NU0alLX4gmfwz96y5h5Nwndfvv5SNwFL4HiV+y8XVZ
         jX3g==
X-Gm-Message-State: AOAM5320NfjXuANgk+NraNGy0toag5Frhpf1Otvn5y1Pu9+W6X53pu5p
	h9Ht6ey7ggneEc8e2phDtL8Evc0YutQ=
X-Google-Smtp-Source: ABdhPJy22dzSdHuXFnPQo80sLLCpXDlO03EmV9ck7F3f4X7hCTm2vWqixVf967sXHRxehFH9SLBobg==
X-Received: by 2002:a63:4761:: with SMTP id w33mr23942811pgk.195.1625625675006;
        Tue, 06 Jul 2021 19:41:15 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:2edf:762b:56c2:a83b? ([2601:647:4000:d7:2edf:762b:56c2:a83b])
        by smtp.gmail.com with ESMTPSA id ev20sm152600pjb.43.2021.07.06.19.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 19:41:14 -0700 (PDT)
Subject: Re: [TECH TOPIC] Rust for Linux
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: Roland Dreier <roland@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <64de6a11-5ff0-9931-d09b-2246cb37b284@acm.org>
 <20210706160857.6d4c63aa@hermes.local>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <f391c00d-7f4f-a60c-0230-4aca5ea2d4ed@acm.org>
Date: Tue, 6 Jul 2021 19:41:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210706160857.6d4c63aa@hermes.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/6/21 4:08 PM, Stephen Hemminger wrote:
> Why not use the GCC cleanup function attribute, it is a lot cleaner than
> having ugly error prone macros.
> 
> #define _cleanup_free __atttribute__((__cleanup__(free)))
> 
> int main(int argc, char **argv)
> {
>           _cleanup_free_ void *p;
>           _cleanup_free_  void *q;

Huh? My code uses the gcc cleanup attribute.

The above code will trigger a crash because gcc passes a pointer to
local variable to the cleanup function (free) instead of the value of
the local variable.

As a sidenote, I'm surprised that C++ is not supported for Linux kernel
code since C++ supports multiple mechanisms that are useful in kernel
code, e.g. RAII, lambda functions, range-based for loops, std::span<>
and std::string_view<>. Lambda functions combined with std::function<>
allow to implement type-safe callbacks. Implementing type-safe callbacks
in C without macro trickery is not possible.

Bart.

