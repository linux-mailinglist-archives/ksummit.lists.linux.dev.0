Return-Path: <ksummit+bounces-5-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id E67863672E0
	for <lists@lfdr.de>; Wed, 21 Apr 2021 20:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id E7ABB1C0F62
	for <lists@lfdr.de>; Wed, 21 Apr 2021 18:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415E02FA0;
	Wed, 21 Apr 2021 18:51:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC342F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 18:51:53 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id i3so24867198edt.1
        for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 11:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i1d9i3H9R8UyWuiuqYfXg6bItjby/vBRfKZq4JzDYsE=;
        b=HqqUeMWXffI8hM8ulrvR5HHhVnaheSlGnCYqQiWpaxGsU7AhtRu8KoawxpGIc1xlBb
         rS9Js/Q/Ft8MyDHLUkljrAMKO3WIEMyMVOZswWmhkmgokf8P8hHXWYX2En5sCrcX9Y07
         wUSYQGqR2NBcyaBwHk54AnR6xb7R117JKEr483ftlZEzkx4kkZkwW1p9HqRLB+rB/GO2
         +kGYL0vv6R11zSzrAnLvCsm4OsKxWrpvCs/0zTyxtmvHkSHbPvz7HANlTVwM5eKcXPsl
         8EocjtwvTvQDY/EVZgd8FLC/bpvIScb7WRvUNFDgcOlIz3tA8t8xtcyXtZ93XUjMbqdL
         /3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i1d9i3H9R8UyWuiuqYfXg6bItjby/vBRfKZq4JzDYsE=;
        b=qmmfYvsJlQ5fx542wU/gLmEY/WyCOPoM1CzVLekZ7i0EAN/iUCkhmljUTe6tSD6acq
         hlI7JnZUV2YwBtQPPDlTB7qx3bovKRlBCXz4hOFhQMb3PNNBV3FFhH/ll0rTtOQ15XIA
         bW/jKfaj/SOVFC6fcaelHclTT6Z+MRf7QpF2Yuhf7SOmMkS42994s12YPNkDkkhoTf10
         5Hq3LJSl5xz1QoH6BMbg0sWKUxHDlWCeoLrZ6Wak6xVdbkySsLLlGNTBrmB2Z8hmqXUK
         KWLzXHxnBGZb90QYHyf6Mnvz4LbVKq8m0sfSSw+U7K0EOxoi48cfQpaPqQAwJ7TeNusV
         R0LQ==
X-Gm-Message-State: AOAM532ig7mBJcjIvk0jCcyrkH5WmtmxeP9qnR4drSEHcPbDe6ZCC95R
	oPzLFGn3vOxh00idESQhDA==
X-Google-Smtp-Source: ABdhPJzGL+EVOKUcZSdTY3n6lh4rO4bsE0DPERiNQqehtaurx8L8Q3E0cvaFUFodGT5Q9n5IlOO24g==
X-Received: by 2002:a05:6402:5a:: with SMTP id f26mr40533617edu.285.1619031112588;
        Wed, 21 Apr 2021 11:51:52 -0700 (PDT)
Received: from localhost.localdomain ([46.53.249.197])
        by smtp.gmail.com with ESMTPSA id n2sm210212edi.32.2021.04.21.11.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 11:51:52 -0700 (PDT)
Date: Wed, 21 Apr 2021 21:51:50 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIB0RvzWYhURa1ui@localhost.localdomain>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>

On Wed, Apr 21, 2021 at 11:35:36AM -0700, James Bottomley wrote:
> Our policy in SCSI for a long time has been no trivial patches accepted
> to maintained drivers, and I think that would be a good start if
> adopted kernel wide, but I think the next policy should be no trivial
> bug fix without a pointer to the actual bug report or report from a
> trusted static checker.  This would likely mean we have to create a
> list of trusted static checkers ... obviously 0day and coverity but
> what else?

How does the list get expanded if new static checker is not on
the list and its patches won't be applied?

