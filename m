Return-Path: <ksummit+bounces-742-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D321568B44
	for <lists@lfdr.de>; Wed,  6 Jul 2022 16:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51B82280A6B
	for <lists@lfdr.de>; Wed,  6 Jul 2022 14:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EDD4C90;
	Wed,  6 Jul 2022 14:31:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981D3360
	for <ksummit@lists.linux.dev>; Wed,  6 Jul 2022 14:31:13 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id z14so14215604pgh.0
        for <ksummit@lists.linux.dev>; Wed, 06 Jul 2022 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=w2xT/7PtZ3tagdbQ/WcQuh2A722VFZF5Mx+6h0X0mqc=;
        b=FHhGi4dSerZiLVraVC71UzQcIY/dX8G9dwqPSniHYz1DMQyHRIUrnPpLmMUDhdIt4F
         DC3km78EYNYJvy0k+6SCXJG16xhLsYFmv8RQyARjtNQ3he+v8hRV/CY0OfDAC/B6Lyg8
         pKy90tQXmQmph/4CMz6TdVEyEriDBESocTMUAWCpgudrr5guo838IXSv8HgB/xl6sbk/
         mNbtMqUPRQjxWHhtxjomSOOu31Hhap+BgnuBux3LL9lRneU4fDbCaVC17gJFgJHcfe3S
         NbYCceM2vHwYRb2abNn0GIhMptJ03g2z0K3nh/kZQCCyBn9AJkDhQh1KVjvqw/dHLKXo
         BAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w2xT/7PtZ3tagdbQ/WcQuh2A722VFZF5Mx+6h0X0mqc=;
        b=HUcha2wvYDdYZJLvqSmFHYuusFYk0sOgwMiK7OjkKVsSvNuB/fniHVI+wMTzCgI3Mj
         wFKTPG3ENv4Vf1Ztsf3gm5MNQSJQvCDXIbKqc7MBSmTQQCT3JpcFFcnyMhHRjOVzfq0T
         TLpe8um9+cXcZZSq+fr7Xc4vYO2uosLOOx5QuhxrhlGyixJMXZPwcXHDo6Kpz1yhdYVA
         VUECOjQ5FTrV7IBiny/OyCRvYj+bQIeb7y755gS2ejZPxDE7IjfLT6pGBXPK6qqvgV+d
         GcqKywrZ/WY94bfBKNaJ6sH+QbABoQEXvuO7qPhv1pIsOZXgJCcnLHmyFH5vWmPrWCmR
         lBSA==
X-Gm-Message-State: AJIora89bZjXjmhTYbs4gdEwAEmuKfMrtNUKUoajZanxO+Ab+uhtGI1Y
	+wZth90g109OrYi3+BGaTHE=
X-Google-Smtp-Source: AGRyM1tb3fDyu58P0qGU+xKZ+uH0ststnJ1GBLgXwZPNsLr3hizpL9L5hnRKltaVSZByHQS2CK1VOg==
X-Received: by 2002:a65:6bd6:0:b0:39d:4f85:9ecf with SMTP id e22-20020a656bd6000000b0039d4f859ecfmr35962872pgw.336.1657117873111;
        Wed, 06 Jul 2022 07:31:13 -0700 (PDT)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id mn1-20020a17090b188100b001ef42b3c5besm4505153pjb.23.2022.07.06.07.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 07:31:12 -0700 (PDT)
Message-ID: <a5544eb7-6044-0b84-cf1c-17ca849c641e@gmail.com>
Date: Wed, 6 Jul 2022 23:31:09 +0900
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 0/5] Address some issues with sphinx detection
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mchehab+huawei@kernel.org, ksummit@lists.linux.dev,
 Akira Yokosawa <akiyks@gmail.com>
References: <cover.1656756450.git.mchehab@kernel.org>
 <d0e1a08a-b965-ada6-e026-4e1cc38fbd90@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <d0e1a08a-b965-ada6-e026-4e1cc38fbd90@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[CC: update address of ksummit]

On Tue, 5 Jul 2022 13:15:57 +0900, Akira Yokosawa wrote:
> Hi Mauro,
[...]
> 
> Fedora, RHEL/CentOS, and openSUSE Leap provide helpful packages
> for installing math expression support.
> 
>     Fedora 36               python3-sphinx-latex (python3-sphinx depends on this)
>     RHEL 9/CentOS stream 9  ditto
>     openSUSE Leap 15.4      python3-Sphinx_4_2_0-latex
>                                 (python3-Sphinx_4_2_0 depends on this) or
>                             python3-Sphinx-latex
>                                 (python3-Sphinx depends on this, version: 2.3.1)

These packages are supposed to cover LaTeX packages necessary
for building LaTeX sources the version of Sphinx generates.

HOWEVER, in my test of openSUSE Leap 15.4, pythno3-Sphinx-4_2_0-latex
does not cover texlive-tex-gyre, which is required since Sphinx 4.0.0.

Changelog of Sphinx 4.0.0 [1] says:

> Dependencies
>
> 4.0.0b1
>
> [...]
>   * LaTeX: add tex-gyre font dependency

[1]: https://www.sphinx-doc.org/en/master/changes.html#release-4-0-0-released-may-09-2021

I'm thinking of opening a ticket at openSUSE's bugzilla.

Fedora 36's python3-sphinx-latex (for Sphinx 4.4.0) has
texlive-collection-fontsrecommended and covers texlive-tex-gyre naturally.

        Thanks, Akira

> 


