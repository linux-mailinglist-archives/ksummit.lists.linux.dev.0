Return-Path: <ksummit+bounces-1120-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FFE79A0E7
	for <lists@lfdr.de>; Mon, 11 Sep 2023 03:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3BEE6280F5B
	for <lists@lfdr.de>; Mon, 11 Sep 2023 01:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CD217CB;
	Mon, 11 Sep 2023 01:05:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF1FA23
	for <ksummit@lists.linux.dev>; Mon, 11 Sep 2023 01:05:13 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-26f4bc74131so2566167a91.1
        for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 18:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1694394313; x=1694999113; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XGsb5tA6YviorNgYPYAcuSq2xr/+oYqZlEkB4PA46Ig=;
        b=OTldVvq1H7QWjQg+L1xgG5BpBIZ1ZzkuLFewwn/OxhOGGIO0u//xUB1b14F1lwKh1q
         oMRVEG4NoPSFRfgpO5riObpARehcqdV00Miia6pmEFBj1maf8hEyiBEfU84+QOZ8V4Dv
         fs4Jet8Wl1SrE6obNi7VJNrUx/buiAJKuWXeiI/0HPeqE5pRBLhe++kdVaCgG15foE6W
         NGj17Z9vfpSmg/ejqbGor4dqXya7MNKazXQS+APkMU7D96UX1FHBy8tJ6oWDBlQ9ApKj
         57BSiLNfh/GT246exlM0QXri+9luCsDAfX/sR9zXnHa28jHwwrzGhptRszlTzYUkj1vT
         Vvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694394313; x=1694999113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGsb5tA6YviorNgYPYAcuSq2xr/+oYqZlEkB4PA46Ig=;
        b=BWH4gHUe4ybPzc3StOfw4zS+JdcMwsGGYdk2undDYUv0I7URv+F0Gngq2XuGCCNecf
         gIE1UoOLymaI2sdrJj28GrV4rWjJDV7KiSudPpHuI1+HvEds1y1UVflWGZD6SrhH8X25
         PXVGQujWXxwmS4r2Z5hsJ9n0S8CMrESetdaVfkD62QPTMs66D/jiQLY1r5fHlKQIRSoV
         jttKwGvtIwKa/aJhtf5/ajWnTNbfyNMJ9oXUu9jwNkMMC8nuGRpxwYZ+JcyYyE55c5vj
         wlU9IuEqI+0phHQKdKXARRQ8wEbd9n9vHjEFWp8KyHf2ZG5oChnJvKNmUaXyfnvlnUq1
         nVsQ==
X-Gm-Message-State: AOJu0YzEcXfw4jhW6t4kDonLzsro2kiI14lO2o1h8LaFXy8ZpsH2K1Zh
	mEsxqSe6u5Uzn6xNodD0pmun/w==
X-Google-Smtp-Source: AGHT+IEkW6xGC3kWXEa6X9EHtzzFluPS/ng0ICT4L0VFLSr3f08T6/z/BrKseFYgb260beyu2Eyv1A==
X-Received: by 2002:a17:90a:c082:b0:273:e090:6096 with SMTP id o2-20020a17090ac08200b00273e0906096mr9125516pjs.11.1694394313037;
        Sun, 10 Sep 2023 18:05:13 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id j7-20020a17090ae60700b0027360359b70sm6225535pjy.48.2023.09.10.18.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 18:05:12 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qfVMT-00DZb6-0s;
	Mon, 11 Sep 2023 11:05:09 +1000
Date: Mon, 11 Sep 2023 11:05:09 +1000
From: Dave Chinner <david@fromorbit.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZP5nxdbazqirMKAA@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
 <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <20230909224230.3hm4rqln33qspmma@moria.home.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230909224230.3hm4rqln33qspmma@moria.home.lan>

On Sat, Sep 09, 2023 at 06:42:30PM -0400, Kent Overstreet wrote:
> On Sat, Sep 09, 2023 at 08:50:39AM -0400, James Bottomley wrote:
> > So why can't we figure out that easier way? What's wrong with trying to
> > figure out if we can do some sort of helper or library set that assists
> > supporting and porting older filesystems. If we can do that it will not
> > only make the job of an old fs maintainer a lot easier, but it might
> > just provide the stepping stones we need to encourage more people climb
> > up into the modern VFS world.
> 
> What if we could run our existing filesystem code in userspace?

You mean like lklfuse already enables?

https://github.com/lkl/linux

Looks like the upstream repo is currently based on 6.1, so there's
already a mechanism to use relatively recent kernel filesystem
implementations as a FUSE filesystem without needed to support a
userspace code base....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

