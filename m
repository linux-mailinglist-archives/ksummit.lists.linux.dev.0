Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB797E3FE3
	for <lists@lfdr.de>; Tue,  7 Nov 2023 14:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52F2828108E
	for <lists@lfdr.de>; Tue,  7 Nov 2023 13:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9973F2FE3F;
	Tue,  7 Nov 2023 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iRVZZLq4"
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1FA2FE03
	for <ksummit@lists.linux.dev>; Tue,  7 Nov 2023 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so849966966b.1
        for <ksummit@lists.linux.dev>; Tue, 07 Nov 2023 05:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699363106; x=1699967906; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9XS3dJnt5Z76p42KXoOzultnxEWbbvlY9kFVwFNBJbw=;
        b=iRVZZLq4TKjO6+JUw/EBRMzTDAfF9UmBbspCf3V58hbvQ9UmLgVx/1yE/VwMTIMDeQ
         CQTnN/2s9EtccVr9NRQ+XiEKXdZtLYQ7WahSGkVerf7pcaY5Gr5R69mTLFSsjwMC18l7
         PNzF90tgvT0OAjFk5/PHKRQfMCFIhgLg0b3YYE5u5rkJpecoT9j//XD0wwxEJpnEca/q
         QL/OmHMkbYhkX0ClnO8yJqysaEI9iJhr4msfvbH5lUAELhqgVSAA6CRHkzZjTzsOO7VQ
         AHMau2w35sQ5tWgP4W9RijLc4+3IMHFWbfTYvISTbCJ0w/Kg8wjAjdZzA0EodwG9js8d
         eoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699363106; x=1699967906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XS3dJnt5Z76p42KXoOzultnxEWbbvlY9kFVwFNBJbw=;
        b=HDQ4uoH4v7q7GHrn0yKnV8lEzdmdYuooLdKvsg0mPLTIq7s9bcKE1vS+XT5EZchhqf
         yi3LT8FHOdJbl7prsurB1gHGKZrSdn5VDpQGiMoEA3qE97P/7GBWi3BYYKxUJjP5jdgH
         MVIGHQWgestIDyN5xwu2NAtpPbY1tQWJUSenB7Xl3+watxcj4Nn2eQReC6xbSNSuWBk7
         2MxyE3HLIAjj2z0slbO19XnfCMOm+bVDBerKwUWKVAaztkEqEOg76s7IFriXNNBTHFTU
         6Pdhtzt34sHFlfsYxZm5CD6v1kXH2u2x639XLRBHLAaBl7xH8qkaIYRecSLcCLtWEUGM
         fwgQ==
X-Gm-Message-State: AOJu0YyMmwhrbhUqLeey/+gNSerj+W+1oizCTrJ2R8gI/IwiqQ13O1I/
	WOF8LLUYbDMQqKU61GGW3UN5xw==
X-Google-Smtp-Source: AGHT+IGlD0AYPSDtNA6rVDR7Xb1TqZERZbOx8q59hGHoePEWI8aiUrp+3Z57ph45KxAMyOjNVqwyoA==
X-Received: by 2002:a17:906:c107:b0:9bf:b022:dc7 with SMTP id do7-20020a170906c10700b009bfb0220dc7mr14893453ejc.48.1699363106350;
        Tue, 07 Nov 2023 05:18:26 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id op17-20020a170906bcf100b009de3fd8cbfasm1044126ejb.0.2023.11.07.05.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 05:18:26 -0800 (PST)
Date: Tue, 7 Nov 2023 16:18:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Pavel Machek <pavel@ucw.cz>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <202ebed9-465e-43d1-bd3a-417ad4a5e425@kadam.mountain>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <ZUluOoDjp/awmXtF@duo.ucw.cz>
 <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
 <20231107101513.GB27932@pendragon.ideasonboard.com>
 <mafs0o7g5hiba.fsf_-_@kernel.org>
 <b36d7b18-2092-1848-e22a-7e34588db0f5@inria.fr>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36d7b18-2092-1848-e22a-7e34588db0f5@inria.fr>

On Tue, Nov 07, 2023 at 07:47:23AM -0500, Julia Lawall wrote:
> At various times, I have wanted to see the discussion that led up to a
> commit, and LKML was the obvious place to go for that.  What will be the
> approach to take in the future?

We'd still use lore.kernel.org and b4 and lei.

regards,
dan carpenter

