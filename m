Return-Path: <ksummit+bounces-111-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E1368517
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 2772D3E80F1
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757D82FA0;
	Thu, 22 Apr 2021 16:42:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F171
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 16:42:16 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id z16so33225605pga.1
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 09:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iU4yOFw9LKq1eK6zO9e5DnyvGd0tM6/l/w4nPZ1QwaU=;
        b=hn337aakVI3oAJ2jI3dayP+yp38ggV/yNd/4gvYK9G8eCwc5Dt5YHvLbDrOcYmfD85
         c0XN6D2LfWWVZbRgU4JPEnS+UTc9W0ueyW5G56XiYzrNXoJDMY3evDNlqzgvxCxdpXe/
         wIBItnodFH8IxjiZ67nMkdpBh8AVF+PgXnBBUu+9BHtDW758JJppAUdGii3mz2ic6eiA
         AJbtZowwwGxqsWEITYIUU7kRluKSGuZUWiGOtZVItShMoZSpCq+lXkS7WAN0+Iqxpjzg
         kmMzpXtv2an2tCZJM2Nim5C6gvhQJLc+lVoCPckRug603VDYAL+grhTspT73JoRSur9Q
         eKWQ==
X-Gm-Message-State: AOAM533unnXB/9rp4GO/pFDA0UJ1pBJc0VxT7gkAQPXK0BD7JWLfSztp
	yY6A4QvMu5AsUiYWJwtV3rqpZnVHcJk=
X-Google-Smtp-Source: ABdhPJwBlBytLm1PvXYra3aGW9EblBryo7eDp50aMeoP9TdsvlwaC/SSJteN4g6Joy50vPOE0JWQvg==
X-Received: by 2002:a63:8949:: with SMTP id v70mr4317855pgd.12.1619109736091;
        Thu, 22 Apr 2021 09:42:16 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:ca3e:c761:2ef0:61cd? ([2601:647:4000:d7:ca3e:c761:2ef0:61cd])
        by smtp.gmail.com with ESMTPSA id j36sm2973043pgi.81.2021.04.22.09.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 09:42:15 -0700 (PDT)
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Joe Perches <joe@perches.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: ksummit@lists.linux.dev
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <yq1y2dbtbrm.fsf@ca-mkp.ca.oracle.com>
 <b8827b4267648f35c31628e73be42efee52f5cf5.camel@perches.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <edd8564c-f565-33f8-dd7f-9bf98a421b8b@acm.org>
Date: Thu, 22 Apr 2021 09:42:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b8827b4267648f35c31628e73be42efee52f5cf5.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/21/21 8:04 PM, Joe Perches wrote:
> And I believe James is referring to whitespace style trivial patches.

Maybe it's just me but I don't like patches that only change whitespace
or the coding style. I'm fine with such patches if these are part of a
larger patch series that also fixes bugs but not if such patches are
posted on their own. "git log -p" and "git blame" are important tools to
learn more about why code evolved into its current state.
Whitespace-only patches make it harder to follow how code evolved into
its current state.

Thanks,

Bart.

