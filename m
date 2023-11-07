Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3470A7E4002
	for <lists@lfdr.de>; Tue,  7 Nov 2023 14:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 655BD1C20C31
	for <lists@lfdr.de>; Tue,  7 Nov 2023 13:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6B430CEF;
	Tue,  7 Nov 2023 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jIiyTqEO"
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDC129414
	for <ksummit@lists.linux.dev>; Tue,  7 Nov 2023 13:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9c603e2354fso1122447966b.1
        for <ksummit@lists.linux.dev>; Tue, 07 Nov 2023 05:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699363453; x=1699968253; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JZDGjEKMk8xYia1ZfSfFomGToUwUjvcMJKQm9xKCgAI=;
        b=jIiyTqEOFhH8LSYRi8LfJFPkSf7fUNG2m+9FK/5ItLWH0i1Bjs6dyaKyvhYamlUHnd
         9aPHom08UA6eCozRBNGSmInr+RZGIyTd3Q96+oM0q5AcWcu7QBOOhHCH/y25BH8OxRmM
         ScRymBwWoTuTzbc7BMq0EDdPVieyaQLD4NQ/dK0Dn9/btNbR1PeFyZnEV85lmj7aqGxp
         t+YxjCl9FBORO8R4dQtKhpqyeVGtxQ9b13nzVN12QFsW5gdoM/ClqGk/EUiHn56l2k//
         usPMfNGoQ6WnSXnndCRxgkG+C0oYOcFQ7HvfAgGSYd84TIxvhVzjM3gp0S3ai/Dk8BJb
         3KNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699363453; x=1699968253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZDGjEKMk8xYia1ZfSfFomGToUwUjvcMJKQm9xKCgAI=;
        b=mtrFXhiVnknkKv9yDymCfMYqIIPS0cQ4E1vSrPFYFuwLTemzDouQIXwUKMdklJb7zv
         LQAZKdHprvHJ18yhaAUkrBumYaN+fIXinshfH0aXyLss537J9rsy4BB9wIzTRtP+bMoz
         C7ug6iEbZ+l9MhtTyNAytEx0b7orrk7xCbweUHs2oSB97esk+Sz+oUS9xHcouLmEoR3v
         G2pmVv4e6HtG66Blup/XKBL7/BbkmGCU0kx5E5hxIOixtOIg7LsTmOdviJ6Mo9BusID0
         RFKIH/huZe9hSS2HthIqx5uXsL/V9jMRUutKucH6TQW4Y55LJ0zm32LWUH8ARpx+uC+R
         S4mQ==
X-Gm-Message-State: AOJu0YwtqOrM0oRRzOLnPgwmZ3Mx5wej9fqAhY7DKXCovyKsO6hXpEi/
	3jCrBhfWdPC90lGq2wjuwT01Pw==
X-Google-Smtp-Source: AGHT+IEd861pLsQzYyzvRysrHXAW3nxhW13tOmEG0jf0kXMMGojx/GtdwtO1BoXd3woi4CbxMmktMg==
X-Received: by 2002:a17:906:fe08:b0:9cd:26e9:a8af with SMTP id wy8-20020a170906fe0800b009cd26e9a8afmr1975452ejb.21.1699363452668;
        Tue, 07 Nov 2023 05:24:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090671d600b009929d998abcsm1027602ejk.209.2023.11.07.05.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 05:24:12 -0800 (PST)
Date: Tue, 7 Nov 2023 16:24:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <a53bcecb-3230-4ad3-8e62-29f4395a26a0@kadam.mountain>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>

It's interesting that you announced this on ksummit@lists.linux.dev
and didn't even bother CC'ing LKML.  That's what I do as well these days
for discussions that affect everyone.  The ksummit list is the defacto
list for general topics.

regards,
dan carpenter

