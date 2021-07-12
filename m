Return-Path: <ksummit+bounces-382-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4383C5D8B
	for <lists@lfdr.de>; Mon, 12 Jul 2021 15:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id DE4241C0D41
	for <lists@lfdr.de>; Mon, 12 Jul 2021 13:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD96C2F80;
	Mon, 12 Jul 2021 13:42:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559F970
	for <ksummit@lists.linux.dev>; Mon, 12 Jul 2021 13:42:36 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id o9so2300509qvu.5
        for <ksummit@lists.linux.dev>; Mon, 12 Jul 2021 06:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Zp8nbS2AyIHaB04zlsGr68CnlSFaavA8JVVuJQmoP40=;
        b=UjPn/QsE8GHiecs55UnVDc1Fq14J4hfP2I1krOnQQK5hUcYtE2M3heed8fOBDU2t57
         5Rv8cUt05WG6Sw27cDdr0wdZqXwf33vIbXAsVeaK1tW4oAwhJ5PaSFHIjgM2TsXs0GzI
         kX/qpREPQ84JPv8pRFnmez9OR6y2u8879XRNOH0W60kfNp5deU4oB4y28stvQAmxJdah
         5/q9ehribi6KSHG+Z/zgbKE4ojhCi/9U9386tD4bP5/e528Xsubw+b/ZjY2DRMpSqQMg
         AZ7irmovuqGGkmb9uj8DPdLGpOwmzZNRKDELz/6mpEQBZTr0lE1XEdSg7ifFtgFZO9nY
         IwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zp8nbS2AyIHaB04zlsGr68CnlSFaavA8JVVuJQmoP40=;
        b=s68Fb1yV1fhwMsBEgTo0r4EUvbD4YCBYegY62N8DCwpQsFHtw6+FruXXtT8TxJMqC0
         jJKtEnbo6FaWbg0npiLIBg4hZx3dDRb5fim+Q5yLSO+OhrOfxxSg7Sj1PFIdm9bs+Dun
         wpWiN4kOWQKRy1kVErbfgVPEGYIkj0EbXE8PzYDYJ4WKtk0O8/R6dnY/i7Det0pmKfOz
         6XgK1RzB6kpN2PMFORM4XLQq4ARNtxX0Cp7P4I2jrjCGOSqolg1uVgm510CbL0+alycS
         LPTbAxQ5zZ2X1qQI0s+B2a9SV77yqiv2wjGDy+9h0NRwi5JmzFcbi1LrMLMN097agl76
         6tbg==
X-Gm-Message-State: AOAM532//J3RWiUyLfgiWwnLDB8OfPbpa+gqYP2kNwLtZoTYmdvT1oT2
	S8bqRAIL5qAMgI/OZadHjwSbkQ==
X-Google-Smtp-Source: ABdhPJxu3W44btFwmiz684JV4KQJ5fLofjDhv4nxi5JnvIp2tE7kWfH/+fpWTk0Ta0CXcIkRmcJ80Q==
X-Received: by 2002:a05:6214:1d29:: with SMTP id f9mr5235161qvd.8.1626097355202;
        Mon, 12 Jul 2021 06:42:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id c13sm5312592qtb.6.2021.07.12.06.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 06:42:34 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1m2wCf-00106W-ER; Mon, 12 Jul 2021 10:42:33 -0300
Date: Mon, 12 Jul 2021 10:42:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg KH <greg@kroah.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
Message-ID: <20210712134233.GA141137@ziepe.ca>
References: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk>
 <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com>
 <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com>
 <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com>
 <20210710070910.GA2190@kadam>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210710070910.GA2190@kadam>

On Sat, Jul 10, 2021 at 10:09:10AM +0300, Dan Carpenter wrote:
> The other thing which is quite tricky to get right is kobj releases.  I
> have a bunch of these static checker warning but they're annoying
> because they're not something which really affects real life so I can't
> be bothered to fix or report them.

I'm not a security researcher, but I often wonder if there are ways
root could exploit these kinds of error unwind bugs during module
loading to exploit the kernel? That is a relevant concern in the
higher integrity modes.

>   1045          if (nr != -1 && nr != vdev->num && warn_if_nr_in_use)
>   1046                  pr_warn("%s: requested %s%d, got %s\n", __func__,
>   1047                          name_base, nr, video_device_node_name(vdev));
>   1048  
>   1049          /* Increase v4l2_device refcount */
>   1050          v4l2_device_get(vdev->v4l2_dev);
>   1051  
>   1052          /* Part 5: Register the entity. */
>   1053          ret = video_register_media_controller(vdev);
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> But then there is no way to clean up from this is
> video_register_media_controller() fails.  If we call put_device() it
> would lead to use after frees in the callers.  We just have to ignore
> the error.

Eg if we ignore these errors and keep going is the kernel object in a
bad state that userspace can exploit?

The solution here is the same as the other cases, use device_add() not
device_register(), put a device_initialize() immediately after the
allocation of vdev and audit/fix the release so it can work on
partially initialized objects.

The idea of a video_register_device() is just not right in a subsystem
so complicated the 'init & register' pattern is a shortcut to save a
few lines in simple drivers. It should never be baked into a subsystem
like this and it certainly shouldn't work the opposide of how
device_register() works: "if video_register_device fails, the
release() callback of &struct video_device structure is *not* called"

Which is why the release function assignment is out of order, and it
is forced to print a warning in a certain error flow :\

> It's a minor thing, but it's so frustrating.

Yes :(

And as others mentioned devm has its own set of bug classes - I've
seen issues with the sequencing of the devm unloads.. Especially when
work queues get involved.

Jason

