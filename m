Return-Path: <ksummit+bounces-323-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E43BF24F
	for <lists@lfdr.de>; Thu,  8 Jul 2021 01:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id BAFAE3E100D
	for <lists@lfdr.de>; Wed,  7 Jul 2021 23:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BB62FAD;
	Wed,  7 Jul 2021 23:09:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AFD70
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 23:09:22 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v5so4993486wrt.3
        for <ksummit@lists.linux.dev>; Wed, 07 Jul 2021 16:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=edNJUKuxK53C9T7wBT/Lo+yiMssFyJBu7uIcvjykS1w=;
        b=fKWwhsoStUAoBvOVEQh7ISGWwvbjiViVCUcUPw5xakpZJ7pzDCh6iCqnyVmQoB0L0V
         D/G8PH07fFHkM5GFR2HjcNOhn8umO0CxbNm+a+aXirPfFgmFE2U4o1UjlC2CVhb0zZJ9
         ufDA1G59Tg+vS2+/nCon4NTaoGlfFN+PYx80x0+CPXX69uhq83B3g0m5QqhQLa8pmaej
         a5ERC2WfXPKvVkrxyc9Y6KZkRB1k+KKSkCHou5hq/4SOjViWYH+G1qaOYSeim26MW5LH
         HzxKBWpmttLn3LPjET0Fs9c8iZpI/a/4tT4HzIwCuNWXbJ8avqr7YyC65j0IbCT+kqRx
         VFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=edNJUKuxK53C9T7wBT/Lo+yiMssFyJBu7uIcvjykS1w=;
        b=f16ciPd79fPW2BvnKiacWpluLLjQ2WaT/xH1f1H3H6GttUdJLsMhDsE9t7NtNoXetc
         FJ/d6ijKm6VLapLEq+hyqLpRK3GqweDLIR23oVPD2+3X2FBAb9oWeuvpTahd4Y7KdeAY
         nGd//fC5HTFh6++kEGLTf+1M8RDlPwUzOcN19Vkt6+yGvLBH//TqYwwvNCmlkBOIyRvQ
         rEMNuhgtJv3dTK8GNbHK6XiUsiIdZ3Z2IPvI3/YQa155NmGeX0NDNnJE8m2YsE82Ylkn
         FJhqsUhEQ75wIvBMSoVsQ9iHUBTUmFd8AOhiDFUr8fptV5J61VHEj5052uQNYew2fS9K
         alWA==
X-Gm-Message-State: AOAM5306G9h1ZRGuDDeIbVPKLwCybpMyeGA9NxCrLD2uVID8ISg/oao6
	Ffd9jCs0/sXbjcyucRUETYsO
X-Google-Smtp-Source: ABdhPJwVQJ8Ty3Ie351Y5eFudvUbKiJaBKhBoQtzARr2p/AzARlwaDWjprTx0MzvLSJSqp91EkliEQ==
X-Received: by 2002:adf:e607:: with SMTP id p7mr30470147wrm.80.1625699361003;
        Wed, 07 Jul 2021 16:09:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:860d:625a:fd59:d699])
        by smtp.gmail.com with ESMTPSA id c12sm340033wrr.90.2021.07.07.16.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 16:09:20 -0700 (PDT)
Date: Thu, 8 Jul 2021 00:09:16 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Jan Kara <jack@suse.cz>
Cc: Greg KH <greg@kroah.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOY0HLj5ld6zHJHU@google.com>
References: <YOVbsS9evoCx0isz@kroah.com>
 <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
 <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com>
 <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com>
 <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707203827.GI18396@quack2.suse.cz>

On Wed, Jul 07, 2021 at 10:38:27PM +0200, Jan Kara wrote:
> On Wed 07-07-21 20:19:19, Wedson Almeida Filho wrote:
> > Where would a lock be needed in the examples above?
> 
> So I think Greg speaks about a situation where you have multiple threads
> and the refcounted object can be looked up through some structure all the
> threads see. And the problem is that the shared data structure cannot hold
> ref to the object it points to because you want to detect the situation
> where the data structure is the only place pointing to the object and
> reclaim the object in that case. Currently I don't see how to model this
> idiom with Rust refs.

The normal idiom in Rust for this is "weak" pointers. With it, each
reference-counted object has two counts: strong and weak refs. Objects are
"destroyed" when the strong count goes to zero and "freed" when the weak count
goes to zero.

Weak references need to upgraded to strong references before the underlying
objects can be accessed; upgrading may fail if the strong count has gone to
zero. It is, naturally, implemented as an increment that avoids going from 0 to
1. It is safe to try to do it because the memory is kept alive while there are
weak references.

For the case you mention, the list would be based on weak references. If the
object's destructor also removes the object from the list, both counts will go
to zero and the object will be freed as well. (If it fails to do so, the
*memory* will linger allocated until someone removes the object from the list,
but all attempts to upgrade the weak reference to a strong one will fail.)

The obvious cost is that we need an extra 32-bit number per reference-counted
allocation. But if we have specialized cases, like the underlying object always
being in some data structure until the ref count goes to zero, then we can build
a zero-cost abstraction for such a scenario.

We can also build specialised zero-cost abstractions for the case when we want
to avoid the 1 -> 0 transition unless we're holding some lock to prevent others
observing the object-with-zero-ref. For this I'd have to spend more time to see
if we can do safely (i.e., with compile-time guarantees that the object was
actually removed from the data structure).

