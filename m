Return-Path: <ksummit+bounces-1063-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D20787882
	for <lists@lfdr.de>; Thu, 24 Aug 2023 21:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C78051C20EE7
	for <lists@lfdr.de>; Thu, 24 Aug 2023 19:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2928215AD7;
	Thu, 24 Aug 2023 19:29:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6332614A81
	for <ksummit@lists.linux.dev>; Thu, 24 Aug 2023 19:29:37 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso2163935ad.3
        for <ksummit@lists.linux.dev>; Thu, 24 Aug 2023 12:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692905376; x=1693510176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOX7PbHhMRFdG/jllgUmwKtu84TtzXPhLDJRoreAKhU=;
        b=fdcGZn56lTfCa8S2C69beD96MMaDKft7XgjZrQlmAnLCe+V4njtHU+0D6DWD+jeno4
         S4RxdEo+IS98UkBEud2glKYJygFl1z6l6Qdxd0TwqwbCy54FCDsRvkeALsHGKDoBG7BK
         Y2whnIidbzZrC3Sb86hca8pblhQyiOriiwoLhLLb/iezwS8lm/ZOlRCJNAHsRPBnZYX6
         4/aqQa4p9nXU98+vCR9Dusyl+an3pZ0bXpvQYr0cghY51JZ57jdvIybwyXBec6QyeTO5
         x2UIn/jEPH4vV/Ad1rH96ZjlPY6LZkTNHPfKL6NZr3C68NSxhaJavQyRo6e0t4fvzD9A
         cGmg==
X-Gm-Message-State: AOJu0Yx1t1ZKNmzmEimmhLXm09iF0U9gjeui4f2DM6qEnoyC32TdCeY7
	JwkwIepjTqZwv1lWPL0cHxg=
X-Google-Smtp-Source: AGHT+IHRJ7G+9jDizAbObbHMgLbaWlqspuPwhDju8OZUfaBqWIvdrMLfCYMjsSTGIbrKhXrRdISHZQ==
X-Received: by 2002:a17:903:44f:b0:1bc:682a:b130 with SMTP id iw15-20020a170903044f00b001bc682ab130mr13431754plb.27.1692905376391;
        Thu, 24 Aug 2023 12:29:36 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:e6ec:4683:972:2d78? ([2620:15c:211:201:e6ec:4683:972:2d78])
        by smtp.gmail.com with ESMTPSA id t8-20020a1709027fc800b001bdcafcf8d3sm32847plb.69.2023.08.24.12.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 12:29:35 -0700 (PDT)
Message-ID: <6c140552-9c1c-5038-35b3-443d60de31f1@acm.org>
Date: Thu, 24 Aug 2023 12:29:34 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [MAINTAINERS SUMMIT] Between a rock and a hard place, managing
 expectations...
Content-Language: en-US
To: "Bird, Tim" <Tim.Bird@sony.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg KH <gregkh@linuxfoundation.org>, Dan Williams
 <dan.j.williams@intel.com>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>
References: <64e404a979f54_4c1f3294d3@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <2023082250-replace-rectangle-1d47@gregkh>
 <20230822142913.GB14596@pendragon.ideasonboard.com>
 <ZOaofrS7/lErEYB5@nvidia.com>
 <CACRpkdbt-GxDgGbpETJTjBXz6qH2yLFgTR8BVVU9EU1uj7tJ+Q@mail.gmail.com>
 <ZOePd+0Ncywxa5kZ@finisterre.sirena.org.uk>
 <BYAPR13MB25035A643E9E57FFFE06B644FD1DA@BYAPR13MB2503.namprd13.prod.outlook.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <BYAPR13MB25035A643E9E57FFFE06B644FD1DA@BYAPR13MB2503.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/23 10:20, Bird, Tim wrote:
> Sony has had experiences where GKI prevented us from making changes 
> to the kernel to address issues raised in carrier certification, 
> causing delays and extra (very funky) workarounds, since we couldn't
> change kernel code directly.  Google is not very responsive to 
> non-top-tier phone vendors, and using GKI you are essentially at 
> their mercy.  GKI, for us, removed some of the value of open source 
> (ie, the ability to modify the source to suit our needs).

Since I'm a Google employee: can you give an example of Google not being
very responsive, e.g. a bug number or patch URL? All the phone vendor
requests I have seen are processed in a reasonable time.

The quality of the Android kernel patches that I have seen and that are 
sent directly to Google is often low. Sometimes there is no other way to 
describe these as a nightmare from the point of view of code maintenance.

The GKI indeed makes changes to the core kernel harder after its API has 
been frozen. Does carrier certification really require changes to the 
core kernel?

Thanks,

Bart.

